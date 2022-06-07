module ApplicationHelper
  def is_admin?
  return if current_user&.admin?

  respond_to do |format|
    format.html {render json: {error: "Tu n'es pas autorisé à accéder à cette page." }}
    format.json {render json: {error: "Tu n'es pas autorisé à accéder à cette page."}, status: :unauthorized}
    end
  end
end
