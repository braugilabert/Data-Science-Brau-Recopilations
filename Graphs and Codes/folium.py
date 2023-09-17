import folium

def folium_map(lat, lon):
    m = folium.Map(location=[lat, lon], zoom_start=13)
    folium.Marker(location=[lat, lon]).add_to(m)

    return m