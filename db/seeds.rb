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
  title: "ICE CREAM",
  description: "Ice cream",
  source_url: "#{url}/o/1_ ICE CREAM.mp4?&alt=media",
  mcs_admin_id: 1
});
Video.create({
  title: "THE LEGS",
  description: "The legs",
  source_url: "#{url}/o/2_ THE LEGS.mp4?&alt=media",
  mcs_admin_id: 1
});
Video.create({
  title: "BEAUTY OR BRAINS",
  description: "Beauty or brains",
  source_url: "#{url}/o/3_ BEAUTY OR BRAINS.mp4?&alt=media",
  mcs_admin_id: 1
});
Video.create({
  title: "LOVE OR CAREER",
  description: "Love or career",
  source_url: "#{url}/o/4_ LOVE OR CAREER.mp4?alt=media",
  mcs_admin_id: 1
});
Video.create({
  title: "SMART SEXY or HILARIOUS",
  description: "Smart sexy or hilarious",
  source_url: "#{url}/o/5_ SMART SEXY or HILARIOUS.mp4?alt=media",
  mcs_admin_id: 1
});
Video.create({
  title: "SKINNY DISCRIMINATION",
  description: "Skinny discrimination",
  source_url: "#{url}/o/6_ SKINNY DISCRIMINATION.mp4?alt=media",
  mcs_admin_id: 1
});
Video.create({
  title: "DO YOUR PARENTS KNOW",
  description: "Do your parents know",
  source_url: "#{url}/o/7_ DO YOUR PARENTS KNOW.mp4?alt=media",
  mcs_admin_id: 1
});
Video.create({
  title: "CAREER OR FAMILY",
  description: "Career or family",
  source_url: "#{url}/o/8_ CAREER OR FAMILY.mp4?alt=media",
  mcs_admin_id: 1
});
Video.create({
  title: "AGE AND CAREER",
  description: "Age and career",
  source_url: "#{url}/o/9_ AGE AND CAREER.mp4?alt=media",
  mcs_admin_id: 1
});
Video.create({
  title: "BESIDE FASHION",
  description: "Beside Fashion",
  source_url: "#{url}/o/10_ BESIDE FASHION.mp4?alt=media",
  mcs_admin_id: 1
});
Video.create({
  title: "MATERNITY LEAVE",
  description: "Maternity leave",
  source_url: "#{url}/o/11_ MATERNITY LEAVE.mp4?alt=media",
  mcs_admin_id: 1
});
Video.create({
  title: "MODELS STRUGGLES",
  description: "Models struggles",
  source_url: "#{url}/o/12_ MODELS STRUGGLES.mp4?alt=media",
  mcs_admin_id: 1
});
Video.create({
  title: "YOUR BEAUTY OR BRAIN",
  description: "Your beauty or brain",
  source_url: "#{url}/o/13_ YOUR BEAUTY OR BRAIN.mp4?alt=media",
  mcs_admin_id: 1
});
Video.create({
  title: "BALANCE WORK LIFE",
  description: "Balance work life",
  source_url: "#{url}/o/14_ BALANCE WORK LIFE.mp4?alt=media",
  mcs_admin_id: 1
});
Video.create({
  title: "PHOTOSHOPED OR NOT",
  description: "Photoshopped or not",
  source_url: "#{url}/o/15_ PHOTOSHOPED OR NOT.mp4?alt=media",
  mcs_admin_id: 1
});
Video.create({
  title: "PHOTOSHOP IN THE INDUSTRY",
  description: "Photoshop in the industry",
  source_url: "#{url}/o/16_ PHOTOSHOP IN THE INDUSTRY.mp4?alt=media",
  mcs_admin_id: 1
});
Video.create({
  title: "WEIRD SITUATION",
  description: "Weird situation",
  source_url: "#{url}/o/17_ WEIRD SITUATION.mp4?alt=media",
  mcs_admin_id: 1
});
Video.create({
  title: "SELFIES & INSTAGRAM",
  description: "Selfies & Instagram",
  source_url: "#{url}/o/18_ SELFIES & INSTAGRAM.mp4?alt=media",
  mcs_admin_id: 1
});
Video.create({
  title: "WOKE UP LIKE THIS",
  description: "Woke up like this",
  source_url: "#{url}/o/19_ WOKE UP LIKE THIS.mp4?alt=media",
  mcs_admin_id: 1
});
