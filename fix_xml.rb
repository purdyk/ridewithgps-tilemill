#!/usr/bin/env ruby

#`wget http://localhost:8889/api/Project/open-streets.xml`
text = IO.read(ARGV[0])
#text.gsub!(/user"><!\[CDATA\[gis/, 'user"><![CDATA[')
text.gsub!(/\/usr\/share\/mapbox\/project\/rwgps/, '.')
#text.gsub!(/\.\/project\/ridewithgps-tilemill/, '')
#text.gsub!(/ne-lakes\/77e50cb0-/, '')
#text.gsub!(/shoreline_300\/ab6b4f6f-/, '')
#text.gsub!(/land\/ae26f3ca-/, '')
#text.gsub!(/processed_p\/7f5a1dfb-/, '')
#text.gsub!(/ne-admin-0\/491a515b-/, '10m_')
#text.gsub!(/ne-admin-1\/60bcb61f-/, '10m_')
#text.gsub!(/world\/60bcb61f-/, '10m_')
#text.gsub!(/world\/39906004-/, '')
#text.gsub!(/cache-features="true"\n/, '')

File.open(ARGV[0], 'w+') { |f| f << text }
