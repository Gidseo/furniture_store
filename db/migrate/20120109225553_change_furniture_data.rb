class Furnishing < ActiveRecord::Base
  attr_accessible :alter, :description, :dimensions_description, :img, :is_main, :name, :seats, :shape
end


class ChangeFurnitureData < ActiveRecord::Migration
  def self.up
    f = Furnishing.find_by_img('avon-sofa-13.jpg')
    f.destroy if f

    f = Furnishing.find_by_img('brook-chair-2.jpg')
    f.update_attribute(:dimensions_description, "Size:Chair|Back:Sprung|Seat:Sprung|Legs:Tapered Mahogany Colour with caster on the front only|Piping:Contrast piped in deep pink|Arm caps: Not included|Fabric:Ian Sanderson Peryton Plaid") if f

    f = Furnishing.find_by_img('dart-chair-6.jpg')
    f.update_attribute(:dimensions_description, "Size: 2.5 seater|Back: Duck Feather and Down Cushions|Seat: Duck Feather and Down Cushions|Legs: Kick Pleat Skirt|Piping:	Contrast piped in deep pink|Arm caps: Included|Fabric: Ian Sanderson Peryton Plaid") if f

    f = Furnishing.find_by_img('frome-sofa-25.jpg')
    f.update_attribute(:dimensions_description, "Size: 2 seater|Back: Hollofil|Seat: Hollofil|Legs: Bun Feet Mahogany Colour|Piping: Contrast piped in dark grey|Arm caps: Included|Fabric: Romo Linara") if f

    f = Furnishing.find_by_img('gainsborough-chair-31.jpg')
    f.update_attribute(:is_main, 0) if f

    f = Furnishing.find_by_img('gainsborough-chair-21.jpg')
    f.update_attribute(:is_main, 1) if f
    f.update_attribute(:dimensions_description, "Size: Chair|Back: Upholstered|Seat: Upholstered|Legs: Dark Mahogany|Piping: Contrast Piped in Red|Arm caps: not included|Fabric: Colefax and Fowler Check") if f

    f = Furnishing.find_by_img('hamble-sofa-14.jpg')
    f.update_attribute(:dimensions_description, "Size: 2.5 Seater|Back: 22inches Duck Feather Scatter Cushions|Seat: Hollofil Cushions|Legs: Turned mahogany Legs castors on front only|Piping: Sofa Self Piped Cushions Contrast piped|Arm caps: included|Fabric: Romo Linara") if f

    f = Furnishing.find_by_img('otter-chair-7.jpg')
    f.update_attribute(:dimensions_description, "Size: Chair|Back: Sprung|Seat: 100% Duck Feather Cushion|Legs: Reeded Dark Mahogany colour|Piping: Self Piped|Arm caps: included|Fabric: Linwood Kilim") if f

    f = Furnishing.find_by_img('parrett-chair-1.jpg')
    f.update_attribute(:dimensions_description, "Size: High Backed Chair|Back: Sprung|Seat: Sprung|Legs: Turned Light Oak with castors on front only|Piping: Self Piped|Arm caps: not included|Fabric: Ian Sanderson Ellipse") if f

    f = Furnishing.find_by_img('stour-chair-26.jpg')
    f.update_attribute(:is_main, 1) if f
    f = Furnishing.find_by_img('stour-sofa-22.jpg')
    f.update_attribute(:is_main, 0) if f

    Furnishing.create(:name=>"Hamble 2.5 Seater",
                      :dimensions_description=>"Size: 2.5 Seater|Back: 22inches Duck Feather Scatter Cushions|Seat: Duck Feather & Down Cushions|Legs: Turned mahogany Legs castors on front only|Piping: Contrast piped|Arm caps: included|Fabric: Scutts and Cole Check",
                      :description=>"Ideally suited to a barn conversion or a Wandsworth Town House| lends itself to freestanding open plan living.  Its low back with scatter cushions makes it perfect for 'snuggling up'.",
                      :img=>"hamble-sofa-46.jpg",
                      :alter=>"Depth of seat|Height of back|Height of seat from the floor|Turned wooden legs with brass castors|Bun feet|Straight skirt|Box pleated skirt",
                      :shape=>"hamble",
                      :seats=>2.5,
                      :is_main=>0
                     )

    Furnishing.create(:name=>"Dart 2 Seater",
                      :dimensions_description=>"Size: 2 seater|Back: Duck Feather and Down Cushions|Seat: Duck Feather and Down Cushions|Legs: Bun Feet Mahogany Colour|Piping: Contrast piped in light green|Arm caps: Included|Fabric: Romo Linara",
                      :description=>"The concept of the Dart range is to make comfortable, compact sofas and chairs with minimal visual impact in a room. For this reason the 2.5 seater sofa is the largest we offer.",
                      :img=>"dart-sofa-6.jpg",
                      :alter=>"Depth of seat|Height of back|Height of seat from the floor|Bun feet|Straight skirt|Box pleated skirt",
                      :shape=>"dart",
                      :seats=>2,
                      :is_main=>0
                     )

  end


  def self.down
    Furnishing.create( :name=>"Avon 2.5 Seater",
                       :dimensions_description=>"Size: 2.5 seater|Back: Sprung Serpentine|Seat: Duck Feather and down cushions|Legs: turned Mahogany colour with castors on front legs only|Arm caps - included|Piping: contrast in deep red|Fabric: Linwood Iona",
                        :description=>"This range looks equally elegant with either a straight kick pleat skirt or bun feet.  Particularly suited to a sophisticated environment, the cover material can make the difference between a trendy piece or more formal.",
                        :img=>"avon-sofa-13.jpg",
                        :alter=>"alter",
                        :shape=>"avon",
                        :seats=>2.5,
                        :is_main=>0
                      ) unless Furnishing.find_by_img('avon-sofa-13.jpg')

    f = Furnishing.find_by_img('brook-chair-2.jpg')
    f.update_attribute(:dimensions_description, "Size: Chair|Back: Sprung|Seat: Sprung|Legs: Tapered mahogany colour with castors on front legs only|Piping: contrast in deep red velvet|Arm caps: not included|Fabric: Zoffany Rossini Velvet") if f

    f = Furnishing.find_by_img('dart-chair-6.jpg')
    f.update_attribute(:dimensions_description, "Size: Chair|Back: Duck feather and down cushion|Seat: Duck feather and down cushion|Kick Pleat Skirt|Piping: Contrast piped in red|Arm caps : included|Fabric: Marvic Clover") if f

    f = Furnishing.find_by_img('frome-sofa-25.jpg')
    f.update_attribute(:dimensions_description, "Size: 2 Seater|Back: 100% Duck Feather|Seat: Hollofil|Legs: Kick Pleat Skirt|Piping: Self Piped|Arm caps: included|Fabric: The Isle Mill Lomond Stripe") if f

    f = Furnishing.find_by_img('gainsborough-chair-31.jpg')
    f.update_attribute(:is_main, 1) if f

    f = Furnishing.find_by_img('gainsborough-chair-21.jpg')
    f.update_attribute(:is_main, 0) if f
    f.update_attribute(:dimensions_description, "Size: Chair|Back: Upholstered|Seat: Upholsteded|Legs: Dark Mahogany|Piping: Self Piped|Arm caps: not included|Fabric: Beaumont and Fletcher Apsley Chenille") if f

    f = Furnishing.find_by_img('hamble-sofa-14.jpg')
    f.update_attribute(:dimensions_description, "Size: 2.5 Seater|Back: 22inches Duck Feather Scatter Cushions|Seat: Duck Feather &amp; Down Cushions|Legs: Turned mahogany Legs castors on front only|Piping: Self Piped|Arm caps: included|Fabric: Etro Shannon") if f

    f = Furnishing.find_by_img('otter-chair-7.jpg')
    f.update_attribute(:dimensions_description, "Size: Chair|Back: Sprung|Seat: 100% Duck Feather Cushion|Legs: Reeded Dark Mahogany colour|Piping: Self Piped|Arm caps: included|Fabric: Colefax and Fowler Calder Stripe") if f

    f = Furnishing.find_by_img('parrett-chair-1.jpg')
    f.update_attribute(:dimensions_description, "Size: High Backed Chair|Back: Sprung|Seat: Sprung|Legs: Turned mahogany with castors on front only|Piping: Self Piped|Arm caps: not included|Fabric: GP &amp; J Baker Caspian Trellis") if f

    f = Furnishing.find_by_img('stour-chair-26.jpg')
    f.update_attribute(:is_main, 0) if f
    f = Furnishing.find_by_img('stour-sofa-22.jpg')
    f.update_attribute(:is_main, 1) if f

    f = Furnishing.find_by_img('hamble-sofa-46.jpg')
    f.destroy if f

    f = Furnishing.find_by_img('dart-sofa-6.jpg')
    f.destroy if f
  end
end
