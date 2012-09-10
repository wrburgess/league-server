class ApiController < ApplicationController
  # #before_filter :authenticate_user!

  # # Rails requires these be from least- to most-specific exception
  # rescue_from Exception, with: :internal_error
  # rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, with: :record_not_found

  # private

  # def log_error exception
  #   wrapper = ActionDispatch::ExceptionWrapper.new(env, exception)
  #   exception = wrapper.exception

  #   trace = wrapper.application_trace
  #   trace = wrapper.framework_trace if trace.empty?

  #   message = ''
  #   ActiveSupport::Deprecation.silence do
  #     message = "\n#{exception.class} (#{exception.message}):\n"
  #     message << exception.annoted_source_code.to_s if exception.respond_to?(:annoted_source_code)
  #     message << "  " << trace.join("\n  ")
  #     logger.fatal("#{message}\n\n")
  #   end
  #   message
  # end

  # def authenticate_user!
  #   u = User.find_by_email(params[:auth_email])
  #   if u and u.valid_password? params[:auth_password]
  #     sign_in u
  #   else
  #     render status: 401, json: { error: 'Authentication failed' } and return false
  #   end
  # end

  # def internal_error exception
  #   message = log_error exception
  #   error = { error: "Cloud server error. Please contact support." }
  #   error[:traceback] = message if %w{development staging}.include? Rails.env
  #   render status: 500, json: error
  # end

  # def record_not_found exception
  #   log_error exception
  #   render status: 404, json: { error: "Record not found." }
  # end

end