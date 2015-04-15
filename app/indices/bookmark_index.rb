ThinkingSphinx::Index.define :bookmark, :with => :active_record do
  # fields
  indexes :name, sortable: true
  indexes url
  indexes domain.domain, as: :bookmark_domain
  indexes taggings.tag.name, as: :tags
end
