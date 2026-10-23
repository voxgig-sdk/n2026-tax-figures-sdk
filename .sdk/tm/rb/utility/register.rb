# N2026TaxFigures SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'graphql'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

N2026TaxFiguresUtility.registrar = ->(u) {
  u.clean = N2026TaxFiguresUtilities::Clean
  u.clean_add = N2026TaxFiguresUtilities::CleanAdd
  u.clean_explain = N2026TaxFiguresUtilities::CleanExplain
  u.done = N2026TaxFiguresUtilities::Done
  u.make_error = N2026TaxFiguresUtilities::MakeError
  u.feature_add = N2026TaxFiguresUtilities::FeatureAdd
  u.feature_hook = N2026TaxFiguresUtilities::FeatureHook
  u.feature_init = N2026TaxFiguresUtilities::FeatureInit
  u.fetcher = N2026TaxFiguresUtilities::Fetcher
  u.make_fetch_def = N2026TaxFiguresUtilities::MakeFetchDef
  u.make_context = N2026TaxFiguresUtilities::MakeContext
  u.make_options = N2026TaxFiguresUtilities::MakeOptions
  u.make_request = N2026TaxFiguresUtilities::MakeRequest
  u.make_response = N2026TaxFiguresUtilities::MakeResponse
  u.make_result = N2026TaxFiguresUtilities::MakeResult
  u.make_point = N2026TaxFiguresUtilities::MakePoint
  u.make_spec = N2026TaxFiguresUtilities::MakeSpec
  u.make_url = N2026TaxFiguresUtilities::MakeUrl
  u.param = N2026TaxFiguresUtilities::Param
  u.prepare_auth = N2026TaxFiguresUtilities::PrepareAuth
  u.prepare_body = N2026TaxFiguresUtilities::PrepareBody
  u.prepare_headers = N2026TaxFiguresUtilities::PrepareHeaders
  u.prepare_method = N2026TaxFiguresUtilities::PrepareMethod
  u.prepare_params = N2026TaxFiguresUtilities::PrepareParams
  u.prepare_path = N2026TaxFiguresUtilities::PreparePath
  u.prepare_query = N2026TaxFiguresUtilities::PrepareQuery
  u.graphql_body = N2026TaxFiguresUtilities::GraphqlBody
  u.graphql_errors = N2026TaxFiguresUtilities::GraphqlErrors
  u.result_basic = N2026TaxFiguresUtilities::ResultBasic
  u.result_body = N2026TaxFiguresUtilities::ResultBody
  u.result_headers = N2026TaxFiguresUtilities::ResultHeaders
  u.transform_request = N2026TaxFiguresUtilities::TransformRequest
  u.transform_response = N2026TaxFiguresUtilities::TransformResponse
}
