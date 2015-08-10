# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Video.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('videos')

video_url = "https://www.googleapis.com/download/storage/v1/b/models-can-smile-videos"
image_url = "https://storage.googleapis.com/models-can-smile-images"

Video.create({
  title: "Ice Cream",
  description: "Ice cream",
  source_url: "#{video_url}/o/1_ ICE CREAM.mp4?&alt=media",
  poster_image_url: "#{image_url}/36 ANDREEA-DIDDY.jpg",
  views: rand(15000..25000),
  fashion_model_name: "ANDREEA DIDDY",
  index_num: 1,
  mcs_admin_id: 1
});
Video.create({
  title: "The Legs",
  description: "The legs",
  source_url: "#{video_url}/o/2_ THE LEGS.mp4?&alt=media",
  poster_image_url: "#{image_url}/37 AGYNESS-DEYN.jpg",
  views: rand(15000..25000),
  fashion_model_name: "AGYNESS DEYN",
  index_num: 2,
  mcs_admin_id: 1
});
Video.create({
  title: "Beauty or Brains",
  description: "Beauty or brains",
  source_url: "#{video_url}/o/3_ BEAUTY OR BRAINS.mp4?&alt=media",
  poster_image_url: "#{image_url}/38 DOUTZEN KROES.jpg",
  views: rand(15000..25000),
  fashion_model_name: "DOUTZEN KROES",
  index_num: 3,
  mcs_admin_id: 1
});
Video.create({
  title: "Love or Career",
  description: "Love or career",
  source_url: "#{video_url}/o/4_ LOVE OR CAREER.mp4?alt=media",
  poster_image_url: "#{image_url}/39 KENDAL JENNER.jpg",
  views: rand(15000..25000),
  fashion_model_name: "KENDAL JENNER",
  index_num: 4,
  mcs_admin_id: 1
});
Video.create({
  title: "Smart Sexy or Hilarious",
  description: "Smart sexy or hilarious",
  source_url: "#{video_url}/o/5_ SMART SEXY or HILARIOUS.mp4?alt=media",
  poster_image_url: "#{image_url}/40 BEST FRIENDS.jpg",
  views: rand(15000..25000),
  fashion_model_name: "ANDIE ARTHUR & ENJA REVA",
  index_num: 5,
  mcs_admin_id: 1
});
Video.create({
  title: "Skinny Discrimination",
  description: "Skinny discrimination",
  source_url: "#{video_url}/o/6_ SKINNY DISCRIMINATION.mp4?alt=media",
  poster_image_url: "#{image_url}/41 JORDAN DUNN.jpg",
  views: rand(15000..25000),
  fashion_model_name: "JORDAN DUNN",
  index_num: 6,
  mcs_admin_id: 1
});
Video.create({
  title: "Do Your Parents Know",
  description: "Do your parents know",
  source_url: "#{video_url}/o/7_ DO YOUR PARENTS KNOW.mp4?alt=media",
  poster_image_url: "#{image_url}/42 jOAN SMALLS & KARMEN PEDARU.jpg",
  fashion_model_name: "JOAN SMALLS & KARMEN PEDARU",
  index_num: 7,
  views: rand(15000..25000),
  mcs_admin_id: 1
});
Video.create({
  title: "Career or Family",
  description: "Career or family",
  source_url: "#{video_url}/o/8_ CAREER OR FAMILY.mp4?alt=media",
  poster_image_url: "#{image_url}/43 BELLA HADID.jpg",
  fashion_model_name: "BELLA HADID",
  views: rand(15000..25000),
  index_num: 8,
  mcs_admin_id: 1
});
Video.create({
  title: "Age and Career",
  description: "Age and career",
  source_url: "#{video_url}/o/9_ AGE AND CAREER.mp4?alt=media",
  poster_image_url: "#{image_url}/44 CARA DELEVINGNE.jpg",
  fashion_model_name: "CARA DELEVINGNE",
  views: rand(15000..25000),
  index_num: 9,
  mcs_admin_id: 1
});
Video.create({
  title: "Beside Fashion",
  description: "Beside Fashion",
  source_url: "#{video_url}/o/10_ BESIDE FASHION.mp4?alt=media",
  poster_image_url: "#{image_url}/45 GIGI-HADID.jpg",
  fashion_model_name: "GIGI HADID",
  views: rand(15000..25000),
  index_num: 10,
  mcs_admin_id: 1
});
Video.create({
  title: "Maternity Leave",
  description: "Maternity leave",
  source_url: "#{video_url}/o/11_ MATERNITY LEAVE.mp4?alt=media",
  poster_image_url: "#{image_url}/36 ANDREEA-DIDDY.jpg",
  views: rand(15000..25000),
  fashion_model_name: "ANDREEA DIDDY",
  index_num: 11,
  mcs_admin_id: 1
});
Video.create({
  title: "Models Struggles",
  description: "Models struggles",
  source_url: "#{video_url}/o/12_ MODELS STRUGGLES.mp4?alt=media",
  poster_image_url: "#{image_url}/37 AGYNESS-DEYN.jpg",
  fashion_model_name: "AGYNESS DEYN",
  views: rand(15000..25000),
  index_num: 12,
  mcs_admin_id: 1
});
Video.create({
  title: "Your Beauty or Brain",
  description: "Your beauty or brain",
  source_url: "#{video_url}/o/13_ YOUR BEAUTY OR BRAIN.mp4?alt=media",
  poster_image_url: "#{image_url}/38 DOUTZEN KROES.jpg",
  views: rand(15000..25000),
  fashion_model_name: "DOUTZEN KROES",
  index_num: 13,
  mcs_admin_id: 1
});
Video.create({
  title: "Balance Work Life",
  description: "Balance work life",
  source_url: "#{video_url}/o/14_ BALANCE WORK LIFE.mp4?alt=media",
  poster_image_url: "#{image_url}/39 KENDAL JENNER.jpg",
  views: rand(15000..25000),
  fashion_model_name: "KENDAL JENNER",
  index_num: 14,
  mcs_admin_id: 1
});
Video.create({
  title: "Photoshopped or Not",
  description: "Photoshopped or not",
  source_url: "#{video_url}/o/15_ PHOTOSHOPED OR NOT.mp4?alt=media",
  poster_image_url: "#{image_url}/40 BEST FRIENDS.jpg",
  views: rand(15000..25000),
  fashion_model_name: "ANDIE ARTHUR & ENJA REVA",
  index_num: 15,
  mcs_admin_id: 1
});
Video.create({
  title: "Photoshop in the Industry",
  description: "Photoshop in the industry",
  source_url: "#{video_url}/o/16_ PHOTOSHOP IN THE INDUSTRY.mp4?alt=media",
  poster_image_url: "#{image_url}/41 JORDAN DUNN.jpg",
  views: rand(15000..20000),
  fashion_model_name: "JORDAN DUNN",
  index_num: 16,
  mcs_admin_id: 1
});
Video.create({
  title: "Weird Situation",
  description: "Weird situation",
  source_url: "#{video_url}/o/17_ WEIRD SITUATION.mp4?alt=media",
  poster_image_url: "#{image_url}/42 jOAN SMALLS & KARMEN PEDARU.jpg",
  views: rand(15000..25000),
  fashion_model_name: "JOAN SMALLS & KARMEN PEDARU",
  index_num: 17,
  mcs_admin_id: 1
});
Video.create({
  title: "Selfies & Instagram",
  description: "Selfies & Instagram",
  source_url: "#{video_url}/o/18_ SELFIES & INSTAGRAM.mp4?alt=media",
  poster_image_url: "#{image_url}/43 BELLA HADID.jpg",
  views: rand(15000..25000),
  fashion_model_name: "BELLA HADID",
  index_num: 18,
  mcs_admin_id: 1
});
Video.create({
  title: "Woke Up Like This",
  description: "Woke up like this",
  source_url: "#{video_url}/o/19_ WOKE UP LIKE THIS.mp4?alt=media",
  poster_image_url: "#{image_url}/44 CARA DELEVINGNE.jpg",
  views: rand(15000..25000),
  fashion_model_name: "CARA DELEVINGNE",
  index_num: 19,
  mcs_admin_id: 1
});
