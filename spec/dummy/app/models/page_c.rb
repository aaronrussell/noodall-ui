class PageC < Noodall::Node
  sub_templates PageB
  root_template!

  main_slots 1
  wide_slots 3
  searchable_keys :title, :body, :description, :keywords
end
