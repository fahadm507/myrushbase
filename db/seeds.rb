# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

string_of_categories = "Accounting
Airlines/Aviation
Animation
Apparel & Fashion
Architecture & Planning
Arts and Crafts
Automotive
Aviation & Aerospace
Banking
Biotechnology
Broadcast Media
Building Materials
Business Supplies and Equipment
Capital Markets
Chemicals
Civic & Social Organization
Civil Engineering
Commercial Real Estate
Computer & Network Security
Computer Games
Computer Hardware
Computer Networking
Computer Software
Construction
Consumer Electronics
Consumer Goods
Consumer Services
Cosmetics
Dairy
Defense & Space
Design
Education Management
E-Learning
Electrical/Electronic Manufacturing
Entertainment
Environmental Services
Events Services
Facilities Services
Farming
Financial Services
Fine Art
Fishery
Food & Beverages
Food Production
Fund-Raising
Gambling & Casinos
Glass, Ceramics & Concrete
Government Administration
Government Relations
Graphic Design
Health, Wellness and Fitness
Higher Education
Hospital & Health Care
Hospitality
Human Resources
Import and Export
Individual & Family Services
Industrial Automation
Information Services
Information Technology and Services
Insurance
International Affairs
International Trade and Development
Internet
Investment Banking
Investment Management
Judiciary
Law Enforcement
Law Practice
Legal Services
Legislative Office
Leisure, Travel & Tourism
Libraries
Logistics and Supply Chain
Luxury Goods & Jewelry
Machinery
Management Consulting
Maritime
Marketing and Advertising
Market Research
Mechanical or Industrial Engineering
Media Production
Medical Devices
Medical Practice
Mental Health Care
Military
Mining & Metals
Motion Pictures and Film
Museums and Institutions
Music
Nanotechnology
Newspapers
Nonprofit Organization Management
Oil & Energy
Online Media
Performing Arts
Pharmaceuticals
Philanthropy
Photography
Political Organization
Primary/Secondary Education
Printing
Professional Training & Coaching
Program Development
Public Policy
Public Relations and Communications
Public Safety
Publishing
Real Estate
Recreational Facilities and Services
Research
Restaurants
Retail
Security
Sports
Staffing and Recruiting
Supermarkets
Telecommunications
Translation
Transportation
Utilities
Venture Capital
Private Equity
Veterinary
Wireless
Writing and Editing
Website Development"
binding.pry
array_of_categories = string_of_categories.split("\n")

array_of_categories.each do |cat|
  Category.create(name: cat)
end
