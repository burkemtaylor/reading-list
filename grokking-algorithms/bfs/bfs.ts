interface DirectedGraph {
  nodes: string[];
  edges: string[][];
}

const graph: DirectedGraph = {
  nodes: ["A", "B", "C", "D", "E", "F"],
  edges: [
    ["A", "B"],
    ["A", "C"],
    ["B", "C"],
    ["C", "D"],
    ["C", "F"],
    ["D", "E"],
    ["E", "D"],
  ],
};

const breadthFirstSearch = (graph: DirectedGraph, source: string, target: string): string[] => {
  if (source === target) {
    return [source];
  }

  const queue: string[] = [source];
  const visited: string[] = [];

  while (queue.length > 0) {
    const current = queue.shift()!;

    if (current === target) {
      visited.push(current);
      break;
    }

    visited.push(current);

    graph.edges.forEach((edge) => {
      if (edge[0] === current && !visited.includes(edge[1]) && !queue.includes(edge[1])) {
        queue.push(edge[1]);
      }
    });
  }

  return visited;
};

console.log(breadthFirstSearch(graph, "A", "F"));
