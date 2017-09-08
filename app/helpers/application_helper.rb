module ApplicationHelper
  def delete_link(path)
  link_to ('<span class="glyphicon glyphicon-remove" area-hidden="true"></span>remove').html_safe,
              path,
              method: :delete,
              data: { confirm: "Are you sure?" },
              class: 'btn btn-danger btn-lg'
  end

  def edit_link(path)
    link_to ('<span class="glyphicon glyphicon-pencil" area-hidden="true"></span>edit').html_safe,
              path,
              class: "btn btn-warning btn-lg"
  end

  def link_to_dash
    link_to ('<span class="glyphicon glyphicon-home" area-hidden="true"></span> home').html_safe,
              dash_welcome_path,
              class: "btn btn-primary btn-lg"
  end

  def link_back(path)
    link_to ('<span class="glyphicon glyphicon-step-backward" area-hidden="true"></span>back').html_safe,
              path,
              class: "btn btn-info btn-lg"
  end

  def link_to_show(path)
    link_to ('<span class="glyphicon glyphicon-new-window" area-hidden="true"></span> show').html_safe,
              path,
              class: "btn btn-success btn-md"
  end

  def link_to_new(path)
    link_to ('<span class="glyphicon glyphicon-plus" area-hidden="true"></span> add new').html_safe,
              path,
              class: "btn btn-success btn-lg"
    
  end

end