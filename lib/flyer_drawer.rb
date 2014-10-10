class FlyerDrawer
def self.draw(flyers)
  pdf = PDF::Writer.new
  flyer.each do |flyer|
    pdf.text flyer.name
  end
  pdf.render
end