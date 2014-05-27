collection :@projects
attributes :id, :title, :description
child(:tasks) { attributes :title }