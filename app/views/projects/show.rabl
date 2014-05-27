object :@project
attributes :id, :title, :description, :due_date, :completed
child(:tasks) { attributes :title, :due_date, :completed }