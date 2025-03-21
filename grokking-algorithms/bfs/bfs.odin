package bfs

import "core:fmt"

DirectedGraph :: struct {
	nodes: []string,
	edges: [][]string,
}

graph: DirectedGraph = {
	{"A", "B", "C", "D", "E", "F"},
	{{"A", "B"}, {"A", "C"}, {"B", "C"}, {"C", "D"}, {"C", "F"}, {"D", "E"}, {"E", "D"}},
}

breadth_first_search :: proc(
	graph: DirectedGraph,
	source: string,
	target: string,
) -> [dynamic]string {
	if source == target {
		path := [dynamic]string{source}
		return path
	}

	queue := [dynamic]string{source}
	visited := [dynamic]string{}

	for len(queue) > 0 {
		current := queue[0]
		ordered_remove(&queue, 0)

		append(&visited, current)

		if current == target {
			break
		}

		for edge in graph.edges {
			isVisited := false

			for v in visited {
				if v == edge[1] {
					isVisited = true
				}
			}

			isQueued := false
			for q in queue {
				if q == edge[1] {
					isQueued = true
				}
			}

			if (edge[0] == current && !isVisited && !isQueued) {
				append(&queue, edge[1])
			}
		}
	}

	return visited
}

main :: proc() {
	visited := breadth_first_search(graph, "A", "F")
	fmt.println(visited)
}
