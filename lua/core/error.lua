-- N2026TaxFigures SDK error

local json = require("dkjson")

local N2026TaxFiguresError = {}
N2026TaxFiguresError.__index = N2026TaxFiguresError

-- Reachable for a debugger, absent from the table itself: the context holds
-- the live spec and options, and an error is what gets dumped or encoded.
local CONTEXT = setmetatable({}, { __mode = "k" })


function N2026TaxFiguresError.new(code, msg, ctx)
  local self = setmetatable({}, N2026TaxFiguresError)
  self.is_sdk_error = true
  self.sdk = "N2026TaxFigures"
  self.code = code or ""
  self.msg = msg or ""
  self.result = nil
  self.spec = nil
  self.status = -1
  CONTEXT[self] = ctx
  return self
end


function N2026TaxFiguresError:context()
  return CONTEXT[self]
end


function N2026TaxFiguresError:error()
  return self.msg
end


function N2026TaxFiguresError:not_found()
  return 404 == self.status
end


-- What make_error attached is already cleaned; the context is not part of
-- the record.
function N2026TaxFiguresError:to_table()
  return {
    sdk = self.sdk,
    code = self.code,
    msg = self.msg,
    status = self.status,
    result = self.result,
    spec = self.spec,
  }
end


function N2026TaxFiguresError:to_json()
  return json.encode(self:to_table())
end


function N2026TaxFiguresError:__tostring()
  return self.msg
end


function N2026TaxFiguresError.__tojson(self)
  return self:to_json()
end


return N2026TaxFiguresError
