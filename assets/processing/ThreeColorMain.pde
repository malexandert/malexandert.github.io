Graph g = new Graph();
int numNodes = 120;
ArrayList edgeArray = new ArrayList();
color[] graphColors = [color(255,0,0), color(0,255,0), color(0,0,255), color(255,0,255), color(0,255,255)];
int currentNode = 0;
int[] order = pi(numNodes);

void setup() {
  size(window.innerWidth, window.innerHeight);
  makeEdgeArray();
  makeGraph();
  frameRate(7);
}

void draw() {
  background(0);
  g.draw();
  if (currentNode == 0) {
    for (Node n: g.nodes) {
      n.nodeColor = 255;
    }
    order = pi(numNodes);
  }
  colorNextNode(order[currentNode]);
  currentNode = (currentNode + 1) % numNodes;

}

void makeGraph() {
  for (int i = 0; i < numNodes; i++) {
    g.addNode(new Node(int(random(20, width-20)), int(random(20, height-20))));
  }

  for (int[] e: edgeArray) {
    int coinFlip = int(random(8));
    if (coinFlip == 7) {
      g.addEdge((Node) g.nodes.get(e[0]), (Node) g.nodes.get(e[1]));
    }
  }
}

void makeEdgeArray() {
  for (int i = 0; i < numNodes; i++) {
    for (int j = i; j < numNodes; j++) {
      if (j != i) {
        edgeArray.add([i,j]);
      } 
    }
  }
}

void makeGraphColors() {
  for (int i = 3; i < 5; i++) {
    int r = int(random(256));
    int g = int(random(256));
    int b = int(random(256));
    graphColors[i] = color(r,g,b);
  }
}

void colorNextNode(int i) {
  int numColor =  int(random(graphColors.length));
  g.nodes.get(i).nodeColor = graphColors[numColor];
}