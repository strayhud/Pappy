# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Field.create([
  {:name=>'platform', :value=>'Java'},
  {:name=>'platform', :value=>'Rails'},
  {:name=>'platform', :value=>'PHP'},
  {:name=>'platform', :value=>'.NET'},
  {:name=>'environment', :value=>'Dev'},
  {:name=>'environment', :value=>'QA'},
  {:name=>'environment', :value=>'Test'},
  {:name=>'environment', :value=>'Production'},
  {:name=>'host', :value=>'One or two'},
  {:name=>'host', :value=>'A Handfull'},
  {:name=>'host', :value=>'A Lot!'},
  {:name=>'host', :value=>'Off the charts!!!'},
  {:name=>'Java', :value=>'JMX'},
  {:name=>'Java', :value=>'Tomcat'},
  {:name=>'Java', :value=>'Glassfish'},
  {:name=>'Java', :value=>'Hibernate'},
  {:name=>'Java', :value=>'Spring'},
  {:name=>'Rails', :value=>'Resque'},
  {:name=>'Rails', :value=>'MongoDB'},
  {:name=>'Rails', :value=>'Rack'},
  {:name=>'Rails', :value=>'Sphynx'},
  {:name=>'PHP', :value=>'Drupal'},
  {:name=>'PHP', :value=>'Joomla'},
  {:name=>'PHP', :value=>'Wordpress'},
  {:name=>'PHP', :value=>'Zend'},
  {:name=>'.NET', :value=>'Perfmon'},
  {:name=>'.NET', :value=>'MySQL'},
  {:name=>'.NET', :value=>'Azure'},
])

User.create([{:email=>'admin@newrelic.com', :password=>'admin1'}])
