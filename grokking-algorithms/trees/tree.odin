package trees

import "core:fmt"

Tree :: struct {
    root: ^Node,
}

Node :: struct {
    value: int,
    left: ^Node,
    right: ^Node,
}


tree_depth_first_search :: proc(t: ^Tree) -> [dynamic]int {
    if t.root == nil {
        return [dynamic]int{}
    }
    
    result := [dynamic]int{}
    
    dfs :: proc(node: ^Node, result: ^[dynamic]int) {
        if node == nil {
            return
        }
        
        append(result, node.value)
        
        dfs(node.left, result)
        
        dfs(node.right, result)
    }
    
    dfs(t.root, &result)
    return result
}

main :: proc() {
    // Create a sample tree
    //       1
    //      / \
    //     2   3
    //    /   / \
    //   4   5   6
    
    node4 := Node{4, nil, nil}
    node5 := Node{5, nil, nil}
    node6 := Node{6, nil, nil}
    node2 := Node{2, &node4, nil}
    node3 := Node{3, &node5, &node6}
    root := Node{1, &node2, &node3}
    tree := Tree{&root}

    // Perform DFS
    result := tree_depth_first_search(&tree)
    fmt.println("DFS traversal:", result)  // Should print: [1 2 4 3 5 6]
}