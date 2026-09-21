local progress = require("fidget.progress")

local M = {}

function M:init()
  local group = vim.api.nvim_create_augroup("CodeCompanionFidgetHooks", {})

  vim.api.nvim_create_autocmd({ "User" }, {
    pattern = "CodeCompanionRequestStarted",
    group = group,
    callback = function(request)
      local handle = M:create_progress_handle(request)
      if request.data and request.data.id then
        M:store_progress_handle(request.data.id, handle)
      end
    end,
  })

  vim.api.nvim_create_autocmd({ "User" }, {
    pattern = "CodeCompanionRequestFinished",
    group = group,
    callback = function(request)
      if request.data and request.data.id then
        local handle = M:pop_progress_handle(request.data.id)
        if handle then
          M:report_exit_status(handle, request)
          handle:finish()
        end
      end
    end,
  })
end

M.handles = {}

function M:store_progress_handle(id, handle)
  M.handles[id] = handle
end

function M:pop_progress_handle(id)
  local handle = M.handles[id]
  M.handles[id] = nil
  return handle
end

function M:create_progress_handle(request)
  local data = request.data or {}
  local strategy = data.strategy or "assist"

  return progress.handle.create({
    title = " Requesting assistance (" .. tostring(strategy) .. ")",
    message = "In progress...",
    lsp_client = {
      name = M:llm_role_title(data.adapter),
    },
  })
end

function M:llm_role_title(adapter)
  if not adapter then return "LLM" end
  local parts = {}
  if adapter.formatted_name then
    table.insert(parts, adapter.formatted_name)
  end
  if adapter.model and adapter.model ~= "" then
    table.insert(parts, "(" .. adapter.model .. ")")
  end
  if #parts == 0 then
    return "LLM"
  end
  return table.concat(parts, " ")
end

function M:report_exit_status(handle, request)
  local data = request.data or {}
  if data.status == "success" then
    handle.message = "Completed"
  elseif data.status == "error" then
    handle.message = " Error"
  else
    handle.message = "󰜺 Cancelled"
  end
end

return M
