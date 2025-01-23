events = [[9,4],[19,5],[2,8],[3,11],[2,15]]
events_map = {
    events[0][0]:events[0][1],
}
for event in range(len(events) - 1):
    diff = abs(events[event][1] - events[event + 1][1])  # Calculate the difference

    if events[event + 1][0] in events_map:
        events_map[events[event + 1][0]] = max(events_map[events[event + 1][0]], diff)
    else:
        events_map[events[event + 1][0]] = diff

print(events_map)
#
max_key = min((key for key in events_map if events_map[key] == max(events_map.values())),
    key=lambda k: (events_map[k], -k))
print(max_key)