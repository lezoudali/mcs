# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Video.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('videos')

url = "https://www.googleapis.com/download/storage/v1/b/models-can-smile-videos"
Video.create({
  title: "Ice Cream",
  description: "Ice cream",
  source_url: "#{url}/o/1_ ICE CREAM.mp4?&alt=media",
  poster_image_url: "assets/images/36 ANDREEA-DIDDY.jpg",
  index_num: 1,
  mcs_admin_id: 1
});
Video.create({
  title: "The Legs",
  description: "The legs",
  source_url: "#{url}/o/2_ THE LEGS.mp4?&alt=media",
  poster_image_url: "assets/images/37 AGYNESS-DEYN.jpg",
  index_num: 2,
  mcs_admin_id: 1
});
Video.create({
  title: "Beauty or Brains",
  description: "Beauty or brains",
  source_url: "#{url}/o/3_ BEAUTY OR BRAINS.mp4?&alt=media",
  poster_image_url: "assets/images/38 DOUTZEN KROES.jpg",
  index_num: 3,
  mcs_admin_id: 1
});
Video.create({
  title: "Love or Career",
  description: "Love or career",
  source_url: "#{url}/o/4_ LOVE OR CAREER.mp4?alt=media",
  poster_image_url: "assets/images/39 KENDAL JENNER.jpg",
  index_num: 4,
  mcs_admin_id: 1
});
Video.create({
  title: "Smart Sexy or Hilarious",
  description: "Smart sexy or hilarious",
  source_url: "#{url}/o/5_ SMART SEXY or HILARIOUS.mp4?alt=media",
  poster_image_url: "assets/images/40 BEST FRIENDS.jpg",
  index_num: 5,
  mcs_admin_id: 1
});
Video.create({
  title: "Skinny Discrimination",
  description: "Skinny discrimination",
  source_url: "#{url}/o/6_ SKINNY DISCRIMINATION.mp4?alt=media",
  poster_image_url: "assets/images/41 JORDAN DUNN.jpg",
  index_num: 6,
  mcs_admin_id: 1
});
Video.create({
  title: "Do Your Parents Know",
  description: "Do your parents know",
  source_url: "#{url}/o/7_ DO YOUR PARENTS KNOW.mp4?alt=media",
  poster_image_url: "assets/images/42 jOAN SMALLS & KARMEN PEDARU.jpg",
  index_num: 7,
  mcs_admin_id: 1
});
Video.create({
  title: "Career or Family",
  description: "Career or family",
  source_url: "#{url}/o/8_ CAREER OR FAMILY.mp4?alt=media",
  poster_image_url: "assets/images/43 BELLA HADID.jpg",
  index_num: 8,
  mcs_admin_id: 1
});
Video.create({
  title: "Age and Career",
  description: "Age and career",
  source_url: "#{url}/o/9_ AGE AND CAREER.mp4?alt=media",
  poster_image_url: "assets/images/44 CARA DELEVINGNE.jpg",
  index_num: 9,
  mcs_admin_id: 1
});
Video.create({
  title: "Beside Fashion",
  description: "Beside Fashion",
  source_url: "#{url}/o/10_ BESIDE FASHION.mp4?alt=media",
  poster_image_url: "assets/images/45 GIGI-HADID.jpg",
  index_num: 10,
  mcs_admin_id: 1
});
Video.create({
  title: "Maternity Leave",
  description: "Maternity leave",
  source_url: "#{url}/o/11_ MATERNITY LEAVE.mp4?alt=media",
  poster_image_url: "assets/images/36 ANDREEA-DIDDY.jpg",
  index_num: 11,
  mcs_admin_id: 1
});
Video.create({
  title: "Models Struggles",
  description: "Models struggles",
  source_url: "#{url}/o/12_ MODELS STRUGGLES.mp4?alt=media",
  poster_image_url: "assets/images/37 AGYNESS-DEYN.jpg",
  index_num: 12,
  mcs_admin_id: 1
});
Video.create({
  title: "Your Beauty or Brain",
  description: "Your beauty or brain",
  source_url: "#{url}/o/13_ YOUR BEAUTY OR BRAIN.mp4?alt=media",
  poster_image_url: "assets/images/38 DOUTZEN KROES.jpg",
  index_num: 13,
  mcs_admin_id: 1
});
Video.create({
  title: "Balance Work Life",
  description: "Balance work life",
  source_url: "#{url}/o/14_ BALANCE WORK LIFE.mp4?alt=media",
  poster_image_url: "assets/images/39 KENDAL JENNER.jpg",
  index_num: 14,
  mcs_admin_id: 1
});
Video.create({
  title: "Photoshopped or Not",
  description: "Photoshopped or not",
  source_url: "#{url}/o/15_ PHOTOSHOPED OR NOT.mp4?alt=media",
  poster_image_url: "assets/images/40 BEST FRIENDS.jpg",
  index_num: 15,
  mcs_admin_id: 1
});
Video.create({
  title: "Photoshop in the Industry",
  description: "Photoshop in the industry",
  source_url: "#{url}/o/16_ PHOTOSHOP IN THE INDUSTRY.mp4?alt=media",
  poster_image_url: "assets/images/41 JORDAN DUNN.jpg",
  index_num: 16,
  mcs_admin_id: 1
});
Video.create({
  title: "Weird Situation",
  description: "Weird situation",
  source_url: "#{url}/o/17_ WEIRD SITUATION.mp4?alt=media",
  poster_image_url: "assets/images/42 jOAN SMALLS & KARMEN PEDARU.jpg",
  index_num: 17,
  mcs_admin_id: 1
});
Video.create({
  title: "Selfies & Instagram",
  description: "Selfies & Instagram",
  source_url: "#{url}/o/18_ SELFIES & INSTAGRAM.mp4?alt=media",
  poster_image_url: "assets/images/43 BELLA HADID.jpg",
  index_num: 18,
  mcs_admin_id: 1
});
Video.create({
  title: "Woke Up Like This",
  description: "Woke up like this",
  source_url: "#{url}/o/19_ WOKE UP LIKE THIS.mp4?alt=media",
  poster_image_url: "assets/images/44 CARA DELEVINGNE.jpg",
  index_num: 19,
  mcs_admin_id: 1
});
