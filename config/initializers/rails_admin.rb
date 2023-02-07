RailsAdmin.config do |config|
  config.asset_source = :importmap

  config.authenticate_with do
    unless current_user&.is_admin?
      flash[:error] = "You are not an admin"
      redirect_to main_app.new_user_session_path
    end
  end
  config.current_user_method(&:current_user)

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
