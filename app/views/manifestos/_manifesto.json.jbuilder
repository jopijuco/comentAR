# frozen_string_literal: true

json.(@manifesto, :title)

json.sections @manifesto_sections do |section|
  json.id section.id
  json.title section.content.render.html_safe
  json.position section.position
  json.url url_for(section)
  json.subsections ManifestoSection.where(manifesto_section_id: section.id).sort_by { |section| section.position } do |subsection|
    json.id subsection.id
    json.title subsection.content.render.html_safe
    json.position subsection.position
    json.url url_for(subsection)
  end
  #json.url url_for(section)
end
