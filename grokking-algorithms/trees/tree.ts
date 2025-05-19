interface Tree {
  root: GraphNode;
}

interface GraphNode {
  value: number;
  left: GraphNode | null;
  right: GraphNode | null;
}

const tree: Tree = {
  root: {
    value: 1,
    left: {
      value: 2,
      left: {
        value: 3,
        left: null,
        right: null,
      },
      right: {
        value: 4,
        left: null,
        right: null,
      },
    },
    right: {
      value: 5,
      left: {
        value: 6,
        left: null,
        right: null,
      },
      right: null,
    },
  },
};

const depthFirstSearch = (tree: Tree): number[] => {
  const values: number[] = [];

  const traverse = (node: GraphNode | null) => {
    if (node) {
      values.push(node.value);
      traverse(node.left);
      traverse(node.right);
    }
  };

  traverse(tree.root);

  return values;
};

console.log(depthFirstSearch(tree));

const breadthFirstSearch = (tree: Tree): number[] => {
  const values: number[] = [];

  const queue: GraphNode[] = [tree.root];

  while (queue.length > 0) {
    const node = queue.shift()!;
    if (node) {
      values.push(node.value);
      queue.push(node.left!);
      queue.push(node.right!);
    }
  }

  return values;
};

console.log(breadthFirstSearch(tree));

/**
 * Note we can only really appreciate the difference in these searches
 * when duplicates are present, allowing there to be 'first' matches which
 * the ideal solution would produce.
 */
