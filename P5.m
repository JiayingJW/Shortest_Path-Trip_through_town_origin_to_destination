%SHORTEST PATH
W = xlsread('P5_data.xlsx','SP','B3:H9')
W(W>100) = 0%convert entries of W more than 100 to 0
%W is the adjacency matrix with weights
labels={'Origin','A','B','C','D','E','Destination'};
%define the labels of the nodes
h=view(biograph(W,labels,'ShowArrows','on','ShowWeights','on'))
%visualize the network based on the adjacency natrix
%find the shortest path from node 1 to node 7
[dist,path] = graphshortestpath(sparse(W),1,7)
%the matlab solution path:Origin-->A-->B-->D-->Destination
% only visit 3 out of 5 towns during the trip.
%In excel, but not 3 times in excel. but you need to consider the budget as well.

%This is becuase Matlab considers the number of path, as small as possible.
%Mark the nodes and edges of the shortest path by coloring
%them red and blue and increasing the line width.
set(h.Nodes(path),'Color',[1 0.4 0.4])
%[1 0.4 0.4] is the RGB color code of red
edges = getedgesbynodeid(h,get(h.Nodes(path),'ID'));
set(edges,'LineColor',[0.25 0.25 0.9])
%[0.25 0.25 0.9] is the RGB color code of blue
set(edges,'LineWidth',1.5)