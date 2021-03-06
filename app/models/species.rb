class Species < ApplicationRecord
	has_many :species_habitats_relationships
	has_many :habitats, through: :species_habitats_relationships
	has_many :my_pokemons

	def habitat
		self.habitats.first.identifier
	end
end
