class Furnishing < ActiveRecord::Base
end

class AddMissingFurnitureData < ActiveRecord::Migration
  def self.up
    Furnishing.create(:name=>"Brook Chair",
                      :dimensions_description=>"Size: Chair|Back: Sprung|Seat: Sprung|Legs: Tapered Mahogany Colour with caster on the front only|Piping: Contrast piped in deep pink|Arm caps: Not included|Fabric: Zoffany Striped Velvet",
                      :description=>"Derived from an antique this is an extremely comfortable chair ideal for reading, in a study or watching television, but equally at home throughout the house especially the kitchen.",
                      :img=>"brook-chair-2a.jpg",
                      :alter=>"Depth of seat|Height of back|Height of seat from the floor|Seat width|Tapered wooden legs with brass castors",
                      :shape=>"brook",
                      :seats=>1,
                      :is_main=>0
                     )

    Furnishing.create(:name=>"Frome 2 Seater",
                      :dimensions_description=>"Size: 2 seater|Back: Hollofil|Seat: Hollofil|Legs: Kick Pleat Skirt|Piping: Self Piped|Arm caps: Included|Fabric: Isle Mill Wool Stripe",
                      :description=>"This is a very versatile range. The 2 seater sofa shown has a raised seat height to make it easier to get out, of ideal for older people.",
                      :img=>"frome-sofa-25a.jpg",
                      :alter=>"Depth of seat|Height of back|Height of seat from the floor|Turned wooden legs with brass castors|Bun feet|Straight skirt|Box pleated skirt",
                      :shape=>"frome",
                      :seats=>2,
                      :is_main=>0
                     )
    Furnishing.create(:name=>"Hamble 2.5 Seater",
                      :dimensions_description=>"Size: 2.5 Seater|Back: 22inches Duck Feather Scatter Cushions|Seat: Duck Feather & Down Cushions|Legs: Turned mahogany Legs castors on front only|Piping: Self Piped|Arm caps: included|Fabric: Etro Stripe",
                      :description=>"Ideally suited to a barn conversion or a Wandsworth Town House| lends itself to freestanding open plan living.  Its low back with scatter cushions makes it perfect for 'snuggling up'.",
                      :img=>"hamble-sofa-14a.jpg",
                      :alter=>"Depth of seat|Height of back|Height of seat from the floor|Turned wooden legs with brass castors|Bun feet|Straight skirt|Box pleated skirt",
                      :shape=>"hamble",
                      :seats=>2.5,
                      :is_main=>0
                      )
     Furnishing.create(:name=>"Otter Chair",
                      :dimensions_description=>"Size: Chair|Back: Sprung|Seat: 100% Duck Feather Cushion|Legs: Reeded Dark Mahogany colour|Piping: Self Piped|Arm caps: included|Fabric: Colefax and Fowler Stripe",
                      :description=>"A classic gentleman's wing back library chair.",
                      :img=>"otter-chair-7a.jpg",
                      :alter=>"Depth of seat|Width of seat;Height of back;Height of seat from the floor",
                      :shape=>"otter",
                      :seats=>1,
                      :is_main=>0
                     )
     Furnishing.create(:name=>"Parrett High Backed Chair",
                      :dimensions_description=>"Size: High Backed Chair|Back: Sprung|Seat: Sprung|Legs: Turned Light Oak with castors on front only|Piping: Self Piped|Arm caps: not included|Fabric: Ian Sanderson Ellipse",
                      :description=>"Covered in a contemporary material this chair would slot into a modern open plan design as easily as in a relaxed country home, it's size makes it ideal occasional seating throughout the house.",
                      :img=>"parrett-chair-1a.jpg",
                      :alter=>"Depth of seat|Height of back|Turned wooden legs with brass castors",
                      :shape=>"parrett",
                      :seats=>1,
                      :is_main=>0
                     )
     Furnishing.create(:name=>"Lambourn Chair",
                      :dimensions_description=>"Size: Chair|Back: Sprung|Seat: Sprung|Legs: Kick Pleat Skirt|Piping: Self Piped|Arm caps: included|Fabric: Colefax and Fowler Check",
                      :description=>"The perfect pull up chair in a living room situation it is also ideal in a bedroom or bathroom.  A great extra seating chair.",
                      :img=>"lambourn-chair-7.jpg",
                      :alter=>"Depth of seat|Turned wooden legs with brass castors",
                      :shape=>"lambourn",
                      :seats=>1,
                      :is_main=>0
                     )
     f = Furnishing.find_by_img('dart-chair-6.jpg')
     f.update_attribute(:dimensions_description, "Size: Chair|Back: Duck Feather and Down Cushions|Seat: Duck Feather and Down Cushions|Legs: Kick Pleat Skirt|Piping: Contrast piped in red|Arm caps: Included|Fabric: Marvic Clover Leaf") if f
     end

  def self.down
    f = Furnishing.find_by_img('brook-chair-2a.jpg')
    f.destroy if f
    f = Furnishing.find_by_img('frome-sofa-25a.jpg')
    f.destroy if f
    f = Furnishing.find_by_img('hamble-sofa-14a.jpg')
    f.destroy if f
    f = Furnishing.find_by_img('otter-chair-7a.jpg')
    f.destroy if f
    f = Furnishing.find_by_img('parrett-chair-1a.jpg')
    f.destroy if f
    f = Furnishing.find_by_img('lambourn-chair-7.jpg')
    f.destroy if f
    f = Furnishing.find_by_img('dart-chair-6.jpg')
    f.update_attribute(:dimensions_description, "Size: 2.5 seater|Back: Duck Feather and Down Cushions|Seat: Duck Feather and Down Cushions|Legs: Kick Pleat Skirt|Piping: Contrast piped in deep pink|Arm caps: Included|Fabric: Ian Sanderson Peryton Plaid") if f
  end
end
