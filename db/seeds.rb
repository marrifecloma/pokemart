# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!(email: 'admin@pokemart.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# Add Healing Items
# Product.create(:name => 'Antidote',
#                :description => 'A spray-type medicine. It lifts the effect of poison from one Pokémon.',
#                :price => 100,
#                :stock_quantity => 100,
#                :image_name => '/images/antidote.png',
#                :category_id => 1)
#
# Product.create(:name => 'Parlyz Heal',
#                :description => 'A spray-type medicine for paralysis. It can be used once to free a Pokemon that has been paralyzed.',
#                :price => 200,
#                :stock_quantity => 100,
#                :image_name => '/images/parlyz_heal.png',
#                :category_id => 1)
#
# Product.create(:name => 'Burn Heal',
#               :description => 'A spray-type medicine for treating burns. It can be used once to heal a Pokémon suffering from a burn.',
#               :price => 250,
#               :stock_quantity => 100,
#               :image_name => '/images/burn_heal.png',
#               :category_id => 1)
#
# Product.create(:name => 'Potion',
#                :description => 'A spray-type medicine for treating wounds. It can be used to restore 20 HP to an injured Pokémon.',
#                :price => 300,
#                :stock_quantity => 100,
#                :image_name => '/images/potion.png',
#                :category_id => 1)
#
# Product.create(:name => 'Super Potion',
#               :description => 'A spray-type medicine for treating wounds. It can be used to restore 50 HP to an injured Pokémon.',
#               :price => 700,
#               :stock_quantity => 100,
#               :image_name => '/images/super_potion.png',
#               :category_id => 1)
#
# Product.create(:name => 'Max Potion',
#                :description => 'A spray-type medicine for treating wounds. It will completely restore the max HP of a single Pokémon.',
#                :price => 2500,
#                :stock_quantity => 100,
#                :image_name => '/images/max_potion.png',
#                :category_id => 1)
#
# Product.create(:name => 'Hyper Potion',
#               :description => 'A spray-type medicine for treating wounds. It can be used to restore 200 HP to an injured Pokémon.',
#               :price => 1500,
#               :stock_quantity => 100,
#               :image_name => '/images/hyper_potion.png',
#               :category_id => 1)
#
# Product.create(:name => 'Full Restore',
#                :description => 'A medicine that can be used to fully restore the HP of a single Pokémon and heal any status conditions it has.',
#                :price => 3000,
#                :stock_quantity => 100,
#                :image_name => '/images/full_restore.png',
#                :category_id => 1)
#
# Product.create(:name => 'Awakening',
#               :description => 'A spray-type medicine used against sleep. It can be used once to rouse a Pokémon from the clutches of sleep.',
#               :price => 200,
#               :stock_quantity => 100,
#               :image_name => '/images/awakening.png',
#               :category_id => 1)
#
# Product.create(:name => 'Revive',
#                :description => 'A medicine that can revive fainted Pokémon. It also restores half of a fainted Pokémon maximum HP.',
#                :price => 1500,
#                :stock_quantity => 100,
#                :image_name => '/images/revive.png',
#                :category_id => 1)
#
# Product.create(:name => 'Ice Heal',
#               :description => 'A spray-type medicine for freezing. It can be used once to defrost a Pokémon that has been frozen solid.',
#               :price => 250,
#               :stock_quantity => 100,
#               :image_name => '/images/ice_heal.png',
#               :category_id => 1)
#
# Product.create(:name => 'Full Heal',
#              :description => 'A spray-type medicine that is broadly effective. It can be used once to heal all the status conditions of a Pokémon.',
#              :price => 600,
#              :stock_quantity => 100,
#              :image_name => '/images/full_heal.png',
#              :category_id => 1)

# Add Pokeballs
# Product.create(:name => 'Pokeball',
#              :description => 'A device for catching wild Pokémon. It is thrown like a ball at a Pokémon, comfortably encapsulating its target.',
#              :price => 200,
#              :stock_quantity => 100,
#              :image_name => '/images/pokeball.png',
#              :category_id => 2)
#
# Product.create(:name => 'Great Ball',
#               :description => '	A good, high-performance Poké Ball that provides a higher Pokémon catch rate than a standard Poké Ball.',
#               :price => 600,
#               :stock_quantity => 100,
#               :image_name => '/images/great_ball.png',
#               :category_id => 2)
#
# Product.create(:name => 'Ultra Ball',
#               :description => 'An ultra-high-performance Poké Ball that provides a higher success rate for catching Pokémon than a Great Ball.',
#               :price => 1200,
#               :stock_quantity => 100,
#               :image_name => '/images/ultra_ball.png',
#               :category_id => 2)
#
# Product.create(:name => 'Premier Ball',
#              :description => '	A somewhat rare Poké Ball that was made as a commemorative item used to celebrate an event of some sort.',
#              :price => 200,
#              :stock_quantity => 100,
#              :image_name => '/images/premier_ball.png',
#              :category_id => 2)
#
# Product.create(:name => 'Repeat Ball',
#               :description => '	A somewhat different Poké Ball that works especially well on a Pokémon species that has been caught before.',
#               :price => 1000,
#               :stock_quantity => 100,
#               :image_name => '/images/repeat_ball.png',
#               :category_id => 2)
#
# Product.create(:name => 'Timer Ball',
#              :description => '	A somewhat different Poké Ball that becomes progressively more effective the more turns that are taken in battle.',
#              :price => 1000,
#              :stock_quantity => 100,
#              :image_name => '/images/timer_ball.png',
#              :category_id => 2)
#
# Product.create(:name => 'Nest Ball',
#               :description => 'A somewhat different Poké Ball that becomes more effective the lower the level of the wild Pokémon.',
#               :price => 1000,
#               :stock_quantity => 100,
#               :image_name => '/images/nest_ball.png',
#               :category_id => 2)
#
# Product.create(:name => 'Net Ball',
#              :description => '	A somewhat different Poké Ball that is more effective when attempting to catch Water- or Bug-type Pokémon.',
#              :price => 1000,
#              :stock_quantity => 100,
#              :image_name => '/images/net_ball.png',
#              :category_id => 2)
#
# Product.create(:name => 'Dive Ball',
#               :description => 'A somewhat different Poké Ball that works especially well when catching Pokémon that live underwater.',
#               :price => 1000,
#               :stock_quantity => 100,
#               :image_name => '/images/dive_ball.png',
#               :category_id => 2)
#
# Product.create(:name => 'Luxury Ball',
#              :description => 'A particularly comfortable Poké Ball that makes a wild Pokémon quickly grow friendlier after being caught.',
#              :price => 1000,
#              :stock_quantity => 100,
#              :image_name => '/images/luxury_ball.png',
#              :category_id => 2)
#
# Product.create(:name => 'Heal Ball',
#               :description => '	A remedial Poké Ball that restores the HP of a Pokémon caught with it and eliminates any status conditions.',
#               :price => 300,
#               :stock_quantity => 100,
#               :image_name => '/images/heal_ball.png',
#               :category_id => 2)
#
# Product.create(:name => 'Quick Ball',
#              :description => 'A somewhat different Poké Ball that has a more successful catch rate if used at the start of a wild encounter.',
#              :price => 1000,
#              :stock_quantity => 100,
#              :image_name => '/images/quick_ball.png',
#              :category_id => 2)
#
# Product.create(:name => 'Dusk Ball',
#             :description => '	A somewhat different Poké Ball that makes it easier to catch wild Pokémon at night or in dark places like caves.',
#             :price => 1000,
#             :stock_quantity => 100,
#             :image_name => '/images/dusk_ball.png',
#             :category_id => 2)
