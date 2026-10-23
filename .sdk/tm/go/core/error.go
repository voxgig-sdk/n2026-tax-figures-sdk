package core

import "encoding/json"

type N2026TaxFiguresError struct {
	IsN2026TaxFiguresError bool
	Sdk                string
	Code               string
	Msg                string
	// Reachable for a debugger, invisible to a serialiser: the context holds
	// the live spec and options, and an error is what gets logged.
	Ctx    *Context `json:"-"`
	Result any
	Spec   any
	// The HTTP status, -1 when there was no response.
	Status int
}

func NewN2026TaxFiguresError(code string, msg string, ctx *Context) *N2026TaxFiguresError {
	return &N2026TaxFiguresError{
		IsN2026TaxFiguresError: true,
		Sdk:                "N2026TaxFigures",
		Code:               code,
		Msg:                msg,
		Ctx:                ctx,
		Status:             -1,
	}
}

func (e *N2026TaxFiguresError) NotFound() bool {
	return 404 == e.Status
}

func (e *N2026TaxFiguresError) Error() string {
	return e.Msg
}

// What makeError attached is already cleaned; the context is not part of
// the record.
func (e *N2026TaxFiguresError) Record() map[string]any {
	return map[string]any{
		"sdk":     e.Sdk,
		"code":    e.Code,
		"message": e.Msg,
		"status":  e.Status,
		"result":  e.Result,
		"spec":    e.Spec,
	}
}

func (e *N2026TaxFiguresError) MarshalJSON() ([]byte, error) {
	return json.Marshal(e.Record())
}
