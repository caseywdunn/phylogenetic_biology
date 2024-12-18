--- 
title: "Phylogenetic Biology"
author: "Casey W. Dunn"
github-repo: caseywdunn/phylogenetic_biology
twitter-handle: caseywdunn
date: "2024-09-12"
site: bookdown::bookdown_site
documentclass: book
bibliography: [book.bib, packages.bib]
biblio-style: apalike
link-citations: yes
description: "An introduction to Phylogenetic Biology."
fig_caption: yes
always_allow_html: true
---













# Preface {-}

## Approach

Models are at the core of modern phylogenetic biology. Models are usually taught in the context of phylogenetic inference, where they are used to look backward in time. This seems to me a bit like teaching students to master driving in reverse before you show them how to drive forward down a road. Phylogenetic models are generative - they explain how data are created under specific evolutionary processes. They are therefore more intuitive to understand in the context of generating data, proceeding in time from ancestral states forward to future states. I therefore focus first on building an intuitive understanding of models in the context of simulation, and only after that apply models to inference and other tasks that look back in time.

## Using this book

This book is intended both for the self directed learner, and for use in a course. 

I wrote it as a text for my course, Phylogenetic Biology (Yale EEB354). We read one chapter a week. We review and discuss the reading on Tuesdays, and then on Thursdays do hands-on work, read papers from the literature, or share student projects.




## Distribution

![](figures/by-nc-nd-600.png)

This work is licensed under the [Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License]( http://creativecommons.org/licenses/by-nc-nd/4.0/). It is available to read online for free at http://dunnlab.org/phylogenetic_biology/, ensuring access to all students worldwide. If there is interest, I will also make paperbacks available for purchase at a reasonable price. Commercial use by others (e.g. the sale of printed copies by anyone other than the author) are not allowed.

This book was rendered from source code, available at https://github.com/caseywdunn/phylogenetic_biology, with `bookdown` [@bookdown2016]. If you are curious about how any of the figures or analyses were done you can examine the source code there.

Please submit any errors you find, typos, or suggestions that you have for improving the manuscript to the issue tracker at https://github.com/caseywdunn/phylogenetic_biology/issues.

## Other resources

The following sites have a wide variety of material that is relevant to the 
theory and and practice of phylogenetic biology.

- An extensive list of tools, tutorials, and examples of phylogenetic tools in 
the programming language R maintained by Briam O'Meara: https://cran.r-project.org/web/views/Phylogenetics.html

- The Workshop on Molecular Evolution at Woods Hole. This is an intensive summer 
course on phylogenetics, with an emphasis on building phylogenetic trees. Check 
out the faculty pages for lecture pdfs: https://molevolworkshop.github.io

- The Applied Phylogenetics Workshop in Bodega Bay. This is another summer course 
on phylogenetics, but with a bit more emphasis on using phylogenies to test 
evolutionary questions: http://treethinkers.org/tutorials/

The following books are great resources for learning more about phylogenetic biology:

- Baum, D. and Smith, S. (2012). Tree Thinking. An Introduction to Phylogenetic 
Biology. [Roberts Publishers](http://www.roberts-publishers.com/tree-thinking-an-introduction-to-phylogenetic-biology.html).

- Paradis, E. (2011) Analysis of Phylogenetics and Evolution with R. 
[Springer](http://www.springer.com/life+sciences/evolutionary+%26+developmental+biology/book/978-0-387-32914-7)

- Felsenstein, J. (2004) Inferring phylogenies. 
[Sinauer Associates](http://www.sinauer.com/detail.php?id=1775).

- Swofford, D. L., Olsen, G. J., Waddell, P. J., & Hillis, D. M. (1996). 
Phylogenetic inference. In: Molecular Systematics, Second Edition. eds: D. M. 
Hillis, C Moritz, & B. K. Mable. [Sinauer Associates](http://www.sinauer.com/detail.php?id=1775)

The following books provide general computational background for the topics covered here:

- Wickham, H., Grolemund, G (2017) R for Data Science. https://r4ds.had.co.nz

- Haddock, S. H. D. and Dunn, C. W. (2010). Practical Computing for Biologists. http://practicalcomputing.org


## License





## Acknowledgements

Thanks in particular to the students of Yale EEB354 in the falls of 2020 (the first course I taught fully online) and 2022. This book started as a collection of lecture notes for this course. The students provided invaluable motivation, feedback, and patience. Thanks in particular to Lauren Mellenthin, the graduate teaching fellow for the course in 2020, and Namrata Ahuja, the teaching fellow in 2022. Members of my lab provided very helpful feedback when I posted new chapters. Steve Haddock and Felipe Zapata also provided close reads of most chapters, often within hours of completing first drafts. Thanks to Richard Hammack, author of Book of Proof, for his helpful advice on self publishing to facilitate student access.

<!--chapter:end:index.rmd-->

# Introduction {#intro}

Phylogenetic biology is the study of evolutionary relationships, and the use of those relationships to study other aspects of biology.

## History of the field

At the dawn of the field, in the second half of the 19th century [@darwin1859; @haeckel1897], phylogenetic biology was largely a speculative endeavor. People looked at similarities and differences across organisms, and made hypotheses about the evolutionary relationships that would give rise to those patterns. It wasn't until the second half of the 20th century that explicit methods were developed to infer phylogenetic relationships [@hennig1966]. This ushered in decades of accelerating phylogenetic methods development that continues to this day. The introduction of explicit model-based approaches to phylogenetic inference was particularly influential [@Felsenstein:1981vk]. These new methods were computationally intensive, but fortunately their rise paralleled the rapid development and widespread availability of powerful computers. 

Beginning in the late 1980s, molecular data became widely used for building phylogenies of extant organisms with data from fragments of a few genes. Starting in about 2010, new generations of high-throughput sequencing technology made it possible to collect sequences for thousands of genes from a broad diversity of organisms in a single study, and right now we are in the earliest days of building phylogenies from broadly sampled high-quality chromosome-level genome assemblies. 

Phylogenetic Biology has always been concerned with figuring out evolutionary relationships. This domain of inquiry is referred to as phylogenetic inference. Phylogenetic inference has been vital to improved classification of species (phylogenetic taxonomy), reconstructing key features in the evolutionary history of many groups of organisms, and is extremely interesting to those who know the organisms well.

Many questions in biology require knowing evolutionary relationships, even if those evolutionary relationships are themselves not of central interest to the investigator. This has led to the rise of another domain often referred to as phylogenetic comparative biology. Instead of ending with trees, as many phylogenetic inference projects do, phylogenetic comparative projects usually start with trees and use them to study the evolution of traits. Comparative questions include whether there is evolutionary covariance between traits, or shifts in rates of evolution along particular branches (also referred to as edges). Phylogenetic comparative methods have become an increasingly large part of the field.

Though phylogeny initially sprung from the field of comparative morphology, and much of the initial focus was on building and analyzing trees with morphological data and using them to study the evolution of morphology, the field has rapidly expanded to encompass many other categories of data. Even so, morphology continues to be vital to building phylogenies in many contexts, including when fossils are available. While most phylogenetic inference is now based on molecular data, phylogenetic comparative methods are routinely applied to all sorts of data and questions.  Phylogenetic comparative methods now play important roles in the study of physiology, ecology, genomics, medicine, and most other parts of biology. 

Phylogenetics is no longer a strictly macroevolutionary field. Some of the most exciting work in recent years has been at the interface of population genetics and phylogenetic biology, helping to unify our perspectives on micro and macroevolution. Phylogenies are now also routinely used to study the evolution of genes and other molecular characters, and also to dive into extremely recent and fast evolutionary processes within species, such as virus pandemics.


## Core concepts

There are a few concepts that are fundamental to understanding phylogenetic analyses (Figure \@ref(fig:intro-concepts)A). These include:

- The topology of the phylogeny. This is the structure of the evolutionary relationships. It can be thought of the branching order of a tree.

- The lengths of the branches in the phylogeny. Length can signify different things, such as time elapsed or amount of expected evolutionary change.

- Characters. The organism attributes under consideration. These include things like leg length, geographic location, a particular site in a particular gene, a physiological attribute, or a feature of genome organization. Characters are also often called traits.

- Character states. The particular values that can be taken by different individuals for specific characters. If leg length is a character, a leg length character state could be 4.3 mm. For a site in a DNA sequence, a character state could be `C`, `G`, `T`, or `A`.

- Models. These are hypotheses about how characters evolve. They take a mathematical and statistical form. For example, a model could describe the covariance between evolutionary changes in different characters, or be a set of functions that describe the probabilities of specific state changes along a branch. Models are abstract representations of biological processes. They are deliberate simplifications that allows us to explicitly describe what we think the most important features of change are. We can make models as simple or complex as we like, but the more complex they are the more information we need to use them effectively. 

- Model parameter values. These are the specific values for terms in the model. In a model that indicates covariance between characters, the specific values in the covariance matrix are model parameter values. If you have a set of functions that describe the probability of changing between particular states for a character, the model parameters include the rates in those functions.

In order to make informative comparisons across species, both for inferring phylogenies and for phylogenetic comparative analyses, we need a unified ontological framework to refer to the same characters and character states in different organisms. This correspondence is provided by the concept of homology. Homology is a hypothesis that the same attribute is present in different entities because that attribute was present in their shared ancestor. Human arms and bird wings are homologous, for example. Homology is a deceptively simple concept that can sometimes be devilishly difficult to define, test, and apply [@wagner2014]. 

\begin{figure}
\includegraphics[width=4.5in]{figures/phylogenetic_analyses} \caption{(A) The primary components of a phylogenetic analysis. This mammal phylogeny and branch lengths are from http://vertlife.org. The organism silhouettes are from http://phylopic.org/. (B) Different analyses tend to take different approaches to these components.}(\#fig:intro-concepts)
\end{figure}

## A unified perspective on phylogenetic studies

Phylogenetics is such a diverse and quickly growing field that sometimes studies can seem to be more different from each other than they are. This is a shame, as it is a lost opportunity to share ideas across domains in the field and to apply what is learned in one context to another context.

Fortunately, phylogenetic biology has a strong conceptual foundation that provides a unified perspective on  phylogenetic studies [@Hohna2014]. Once you have this in mind, you can better see the relationships between what may initially appear to be very different methods, questions, and analyses.

Consider some of the concepts we introduced above:

- Topology
- Branch lengths
- Characters
- Character states of tips
- Character states of ancestors
- Model
- Model parameters

The investigator can generally take one of three approaches to each of these (Figure \@ref(fig:intro-concepts)B). They either:

- Clamp the value according to information in hand, such as their own data or the results of a previous study
- Estimate the value
- Don't care about the value

Many phylogenetic inference studies use expert knowledge to define and clamp the characters, run some preliminary analyses to evaluate and then clamp the model, and clamp the character states at the tips according to the observed data such as gene sequences. They then estimate the topology, branch lengths, character states of ancestors, and model parameters. They then throw away the estimates of ancestral character states and model parameters, and present the topology and branch lengths as the result. The end result is that you get a tree of the inferred evolutionary relationships between your organisms of interest.

Many phylogenetic comparative analyses take the same approach to characters and observed character states at the tip (both clamped), and ancestral character states (estimated, but discarded). They then take a different approach to the remaining items. They clamp the tree and branch lengths according to the results of an earlier phylogenetic inference, evaluate different models, and estimate model parameters. The models and model parameters are then the presented results. They would report, for example, that a model that allows for shifts in rates of evolution along different branches is a better fit than a model that doesn't, or provide estimates of the evolutionary covariance between traits.

Other studies apply the three approaches (clamp, estimate, don't care) in different ways across the phylogenetic study. Some combinations are very common, others very rare. Some have yet to be explored at all. There are a few reasons for this variation. One is historical. Some combinations became widespread early on and stayed that way as later studies were created in the image of earlier studies. Another reason is methodological. Some combinations are rare or nonexistent in practice because they require methods development that hasn't been done yet. Data limitations are another big issue. It takes more data to estimate more things. As you get more data, you can unclamp more things. And the biggest limitation is often computational. Phylogenetic analyses are often computationally expensive, and this can quickly become limiting. This is often the ceiling in practice, but more efficient software tools, improved methods, and new data are all helping to make analyses more tractable at the same time that more computer power is becoming available to more investigators.

Once you dig in, the "don't care" case is surprisingly interesting. Sometimes if you don't care about something, you don't need to estimate it. But often you do need to estimate something intermediate to get to what you do care about, and then you just throw away the intermediate result. Things that you aren't specifically interested in but that you need to estimate to figure out what you do want to learn are referred to as nuisance parameters. Some nuisance parameters aren't even retained by software, but others are. I mean "don't care" in the specific sense that these entities aren't part of your primary question. You should very much care whether your nuisance parameter estimates are sensible since other results depend on them, and you should examine them to make sure they are sensible. 

Some studies differ only in which estimates are kept and which are thrown away. One person's nuisance is another's bread and butter. One study may keep ancestral character states and discard model parameters, and another study may run essentially the same analysis but discard ancestral character states and keep model parameters.


## Applications

With this framework in mind, let's take a look at a sampling of recent phylogenetic studies. 

- [Nextstrain](https://nextstrain.org/sars-cov-2/) provides a frequently updated phylogeny of sars-cov-2, with associated data on geography, sampling time, and other factors [@hadfield2018nextstrain]. This has been critical to understanding and monitoring the sars-cov-2 pandemic, and intervening to disrupt transmission. They are using observed character data at the tips (virus genome sequences) to estimate topology, branch lengths, and model parameters.

- Myxozoa are enigmatic parasites that live in fish. They have very few morphological traits that show clear homology with other animals. So Sally Chang, Paulyn Cartwright, and colleagues used phylogenetic inference to examine their relationships to other animals, and found strong support for their placement within Cnidaria [@chang2015genomic].

- My own lab wanted to see if the evolution of gene expression is more rapid after gene duplication than after speciation [@dunn2018pairwise]. We found no evidence for such a difference. We used the results of previous studies to clamp gene phylogenies and gene expression character states at the tips, and estimated ancestral expression states to examine sifts in expression along particular branches.

- *Viburnum* is a group of plants with wide distribution in many different habitat types. Michael Landis spearheaded a collaborative project between the Edwards and Donoghue labs here at Yale EEB to understand how *Viburnum* first diversified in Asia during the Eocene and then spread across the globe [@landis2020joint]. They clamped the character states at the tips based on gene sequence data, morphology, and geographic range, developed innovative methods to simultaneously estimate the phylogeny, branch length, and ancestral geographic ranges. This is the vanguard of new approaches that simultaneously consider multiple categories of data rather than bolt together multiple independent methods that estimate one thing at a time.

This is a very exciting time in phylogenetic biology. For many years most studies followed a few basic templates. With the development of new phylogenetic methods, new tools to collect high throughput character data, and a growing interest in phylogenetic questions, the field is now in its most interesting stage of development and application yet.


<!--chapter:end:intro.rmd-->

# Phylogenies


\begin{figure}
\includegraphics[width=4.56in]{figures/darwin} \caption{Darwin's depiction of the evolutionary relationships between organisms (Darwin, 1859).}(\#fig:trees-darwin)
\end{figure}

Phylogenies represent evolutionary relationships. The only figure in Darwin's Origin of Species [@darwin1859] was a phylogeny (Figure \@ref(fig:trees-darwin)), though he didn't call it that.

Phylogenies are often referred to as trees. It is an apt analogy. From the anchoring of the tree at a root, to the depiction of lineages as branches, to the presentation of tips as leaves, there is a direct correspondence. Many of the first speculative phylogenies were illustrated as actual trees, including Haeckel's tree in the manuscript [@haeckel1897] where he coined the term phylogeny (Figure \@ref(fig:trees-haeckel)).


![(\#fig:trees-haeckel)Haeckel's hypothesis of the animal phylogeny [@haeckel1897], drawn as an actual tree.](figures/haeckel.jpg) 

Not all trees in biology are phylogenies, though. For example, 
hierarchical clustering of traits across species results in trees that represent similarity of species, but does not necessarily show evolutionary relationships. In some cases phylogeny and species clustering 
will be largely congruent, but in many cases they will not be. Hierarchical tree-like clustering is also 
used for things that have no evolutionary component, like similarity of responses 
to a drug.

It is helpful, then, to be more precise about the components of a phylogeny, and 
what each of those parts represent.


## Phylogenies are graphs

In order to establish a strong foundation for thinking about phylogenies, it is 
helpful to turn to math.

\begin{figure}
\includegraphics[width=2.5in]{figures/graph} \caption{Simple graph. Nodes are represented by circles, and edges by lines. Note that this graph has a cycle (you could walk in a circle between nodes 1, 2, and 4). It is also not bifurcating.}(\#fig:trees-graph)
\end{figure}

A phylogeny is a specific instance of a mathematical object known as a [graph](https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)). 
A graph consists of nodes, often represented as circles, connected by edges, often 
represented by lines (Figure \@ref(fig:trees-graph)). Graphs are useful representations of a variety of systems.
For example, nodes could be people, and edges family relationships, connections in a social network, or financial transactions. We often refer to the edges in phylogenies as branches.


\begin{figure}
\includegraphics[width=2.89in]{figures/graph_tree} \caption{Graph representing a phylogeny. The tip nodes typically represent sampled entities, like living organisms, sequenced genes, or fossils. The internal nodes are ancestors that immediately precede divergence events. The root is a special internal node that has no parent. It is acyclic (ie, there are no paths that go in circles). The graph is bifurcating-- the root node has two branches that connect it to its children, the other internal nodes each have three branches (one that connects to the parent, two to children), and the tips each have one branch (that connects to their parents).}(\#fig:trees-graph-tree)
\end{figure}

Phylogeny graphs (Figure \@ref(fig:trees-graph-tree)) usually have a few specific topological properties:

- They are acyclic. This means that there is only one possible path along edges from one node to another. It isn't possible to go in circles. Exceptions can arise in cases of horizontal 
gene transfer or hybridization.

- They tend to be bifurcating. This means that each internal node has one parent node and two daughter nodes, and therefore three branches connected to it. This represents the biological understanding of speciation, which usually proceeds by one lineage giving rise to two lineages. 

- They can be directed. This means that branches are not symmetric, and instead have 
directionality. Specifically, they denote time. The node on one end of the branch 
is older than the node on the other end of the branch. We therefore can refer to the nodes connected to a particular branch as the parent node and child node.

A phylogenetic graph is an abstraction, and for it to be useful it is important to keep in mind what features of biology we are attempting to represent. The nodes are entities that can evolve, like organisms or genes. The branches indicate evolutionary relationships between those entities. You could imagine as, an extreme case, a graph that showed every single individual that ever existed in your group of interest, say mammals. Each branch would connect literal parents and offspring. That would be a big phylogeny, and you would never have enough information to know it all, but it does exist even if unknowable and unwieldy given our current tools. A phylogeny is a subset of that graph, where we often retain a single individual per species as the tip nodes, and retain nodes immediately preceding divergence events as the internal nodes. In this respect, a phylogeny is a subgraph of the entire history of life on Earth. Because many generations are collapsed along a single branch, parent-child node relationships in the tree don't mean actual parent-child relationships. Parent-child nodes are often separated by millions of generations.

## Drawing phylogenies

Here we will work with some mammal phylogenies, mostly because their silhouette icons are so recognizable and because there are extensive phylogenies available for this group [@upham2019].

You will rarely see a phylogeny depicted as in Figure \@ref(fig:trees-graph-tree), with a circle for every node. It gets too cluttered. Instead, it is simpler to draw just the branches (Figure \@ref(fig:trees-mammal)), with the nodes implied at the ends of branches. The nodes are implied.

![(\#fig:trees-mammal)Phylogeny of some mammals. Topology and branch lengths  from http://vertlife.org.  The organism silhouettes are from http://phylopic.org/. Note that node circles are not drawn, instead nodes are implied at ends of branches.](phylogenetic_biology_files/figure-latex/trees-mammal-1.pdf) 

There is considerable variation in how the same phylogeny can be drawn (Figure \@ref(fig:trees-layouts)). This gives some flexibility in deciding what presentation is best for your particular goals, but can also create confusion because two images that look very different may in fact be of the exact same phylogeny. 

Rectangular layouts are the most common, because the entire branch length is along one axis of the plot. In a rectangular tree, each node is depicted as a line that is perpendicular to the branches. If the branches are horizontal, so that time reads from right to left, these node lines are vertical lines at the end of each internal branch (Figure \@ref(fig:trees-layouts)A). The confusing thing is that, because these node lines have the same width and color as the branches, it looks as if they are part of the branches. They aren't though-- their length is arbitrary, and they just space out the daughter branches. Node lines also add right-degree elbows where the ends of the node lines connect to the branches, forming a corner.

Slanted layouts avoid the node lines and elbows of rectangular layouts, but because the branches aren't parallel and can be at a variety of angles, it isn't always easy to read branch lengths on them. 

Circular layouts place the root at the center, and the tips around the circumference. This is a compact representation that works well for very large phylogenies. 


![(\#fig:trees-layouts)The same tree as above, laid out in several different ways.](phylogenetic_biology_files/figure-latex/trees-layouts-1.pdf) 

## Some properties of phylogenies {#tree-properties}

In a fully bifurcating phylogeny with $n$ tip nodes, the following will be the case:

- There are $n-1$ internal nodes. For example, Figure \@ref(fig:trees-graph-tree) shows a phylogeny with 4 tip nodes (labeled 1-4) and 3 internal nodes (labeled 5-7). The total number of nodes (tip nodes and internal nodes) is therefore $2n-1$.

- Each tip node has a single branch, which connects it to its parent node.

- The root node, which is a special internal node that is older than all other nodes, has no parent branch, so it has only two branches. These connect it to its immediate descendant nodes (its children).

- All internal nodes in the tree other than the root have three branches - one connected to a parent node, and two connected to child nodes.

- Since every branch in the tree has a single child node, and each node in the tree except for the root as a parent branch, the total number of branches in the tree is $2n-2$.

The function for the number of possible rooted phylogenies for $n$ tips is:

\begin{equation} 
  f\left(n\right) = \frac{(2n-3)!}{2^{(n-2)}(n-2)!}
  (\#eq:ntrees)
\end{equation} 

This gets big really, really fast as $n$ increases. For a phylogeny of 5 tips there are 105 possible topologies. For a phylogeny of just 10 tips there are already 34,459,425 possible topologies. For a phylogeny of 50 tips there are $2.75\times10^{76}$ possible topologies. This very large number of possible trees is a major challenge when it comes to inferring phylogenies from data -- it is impossible to consider all possible topologies.

## Rotating nodes

One of the most important things to keep in mind when interpreting a phylogeny is that the order of the tips doesn't convey any information. You can rotate any internal node, changing the order of the tips, and you still have the exact same phylogeny, just drawn a different way (Figure \@ref(fig:trees-rotations)). The topology remains unchanged. It's the connections that tell us about the relationships. JD Laurence-Chasen, a former student in my invertebrate zoology course, made an excellent video about this -- https://vimeo.com/148794860 . The major implication of this is that you should never read a phylogeny across the tips to see, for example, which species are more closely related. You always need to look at the structure of the phylogeny itself.

![(\#fig:trees-rotations)The exact same phylogeny, drawn a few times with different node rotations.](phylogenetic_biology_files/figure-latex/trees-rotations-1.pdf) 

## The meaning of branch lengths {#trees-branch-lengths}

Another type of variation in phylogeny depiction is the meaning of branch length (Figure \@ref(fig:trees-types)). A phylogeny where branch lengths are scaled to time is known as a chronogram. Chronograms of organisms all sampled at the same time will be ultrametric, ie the tip nodes will be flush. If tips are sampled at different times, for example when including fossils or sampling a rapidly evolving virus at different time points, they will not be ultrametric.

In many cases we don't have the information needed to scale branches to time, which requires fossil calibrations. Most published phylogenies therefore scale the branches according to the expected amount of evolutionary change in the characters under consideration. The longer the branch, the greater the expected change. The rate of evolution usually varies a bit across branches, so phylograms are not usually ultrametric. 

Sometimes we are only interested in, or only have information about, the topology of the phylogeny. In this case we can draw the branches whatever length we want, and we call the phylogeny a cladogram. Cladograms can also be useful for showing annotations on branches in phylogenies with a wide variation in branch lengths, since there might not be enough room to write labels on very short branches. 

It is always good practice whenever you show a phylogeny to indicate whether it is a chronogram, phylogram, or cladogram. Unfortunately, this is inconsistent in the literature, and not always clear from the figure legend or text. If you aren't sure what branch length means it is best to just ignore branch lengths and treat the phylogeny as if it were a cladogram.

![(\#fig:trees-types)Several types of trees. In a chronogram, branch lengths are scaled according to time. In a phylogram, branch lengths are scaled according to expected amount of evolutionary change, which can differ across characters and branches. In a cladogram, the branch lengths have no meaning. ](phylogenetic_biology_files/figure-latex/trees-types-1.pdf) 


## Naming nodes and groups

One of the most useful applications of phylogenies is to concisely refer to groups of organisms in light of their evolutionary history.

A convenient way to designate groups of organisms is by their most recent common ancestor (MRCA). One of the core concepts in phylogenetic biology is the clade - a group of tips that includes their MRCA and all of its descendants. A group is said to be monophyletic (Figure \@ref(fig:trees-groups)A) if it satisfies these criteria (you don't need to use the double descriptor "monophyletic clade", since a clade is by definition monophyletic). Since internal nodes are included in this definition, you can think of a monophyletic group as a subtree that is formed by clipping the branch just below the MRCA.

![(\#fig:trees-groups)(A) A monophyletic group, *i.e.* a clade. (B) A polyphyletic group. (C) A paraphyletic group that does not include the rabbit.](phylogenetic_biology_files/figure-latex/trees-groups-1.pdf) 

Any internal node in a rooted phylogeny can be uniquely described as the MRCA of two or more tips. You can therefore use sets of tips to designate a particular internal node, and then use that node to define a clade. For example, we could clearly designate mammals as all the descendants of the MRCA of humans and duck billed platyups. This is a very compact and unambiguous way to name groups of organisms. In fact, an entire biological nomenclature has been built with phylogenetically defined names like these [@deQueiroz2020].

Not all groups are monophyletic. For example, the group consisting of people and mice to the exclusion of rabbits is not monophyletic. Their MRCA is easy enough to find, and once found it is clear that not all descendants of this node are included in the group. Slightly different terminology is used for such groups depending on how we think about internal nodes and branches. If we think of this set of non-monophyletic tips as isolated tips, to the exclusion of the MRCA, then we say the group is polyphyletic (Figure \@ref(fig:trees-groups)B). If we think of it as including the MRCA but excluding all the other tips descended from that MRCA that are not in the group, then we call it paraphyletic (Figure \@ref(fig:trees-groups)C). In extreme cases the distinction is clearer. For example, if you have a large group of 100 species that is monophyletic except for the exclusion of a couple species nested well within the group, then it would usually be referred to as paraphyletic. If you were referring to a small group of tips scattered across a very large phylogeny with hundreds of tips, then it would usually be referred to as polyphyletic.


## Polytomies

Some phylogenies are not strictly bifurcating. An internal node with more than two branches connecting it to descendants is called a polytomy (Figure \@ref(fig:trees-polytomies)B-D). This can be to uncertainty about branching order (a soft polytomy) or multiple divergence events in very quick succession, giving rise at effectively the same time to more than two lineages (a hard polytomy).

A phylogeny that consists entirely of a single polytomy is said to be entirely unresolved -- it has no topological information. When laid out in a rectangular format, it looks like a comb (Figure \@ref(fig:trees-polytomies)D). When laid out in a slanted format it looks like a star. So you will hear fully unresolved trees referred to as comb or star phylogenies.

![(\#fig:trees-polytomies)(A) The fully resolved mammal tree used in other figures. (B-C) Different polytomies created in this tree by collapsing some groups. (D) A fully unresolved comb tree.](phylogenetic_biology_files/figure-latex/trees-polytomies-1.pdf) 


## Rooting

All the phylogenies we have seen so far are rooted -- we know what the oldest point is in the tree, and call it the root node. This special internal node has no branch connecting it to a parent node, and all other nodes in the phylogeny are its descendants. One consequence of having a rooted tree is that we know the direction of time along each branch -- time proceeds from the root to the tips. This provides a clear parent-child relationship between nodes at the ends of each branch.

Not all phylogenies are rooted. Sometimes we just don't care -- some questions and methods don't depend on where the root is, so we don't have to bother placing it. Sometimes we just don't know -- placing the root in a phylogeny takes information that sometimes we don't have. There are many phylogenetic studies focused on identifying the location of the root in various groups of organisms, this is often an interesting and important question. 

Even when we don't know where the root of a phylogeny is, we often want to talk about other aspects of the tree, such as the topology and branch lengths. This means we need to think about how to think about unrooted phylogenies. 

There are some basic things we can't take for granted in an unrooted phylogeny. We don't, for example, know which way time goes along the branches. We don't know which internal nodes are child nodes and which are parent nodes. We don't know which of the branches attached to an internal node connect to older nodes and which to younger nodes.

![(\#fig:trees-rooted-abstract)These four cladograms have the same tips and same topology, only their layout differs. (A) The first layout is unrooted. The other layouts are rooted on the black node (B), gray node (C), and gray branch (D). Each of these elements are in the exact same topological positions in all trees. When the tree is rooted on the black or gray nodes, the base of the tree is a polytomy since these nodes have three branches attached to them. No nodes are added or removed when rooting on a node. When rooting on the gray branch, a new unrooted node is added along the branch. This new node is bifurcating.](phylogenetic_biology_files/figure-latex/trees-rooted-abstract-1.pdf) 

The root could fall at any point in an unrooted phylogeny, either along an branch or right at an internal node. You can think of rooting a phylogeny as grabbing the point that you think is the root and dragging it until all the branches point away from it (Figure \@ref(fig:trees-rooted-abstract)B-D). If you grab at some point along a branch (Figure \@ref(fig:trees-rooted-abstract)D), this creates a new node that is the root. This new root node has two branches connecting it to descendants (these two branches arise by splitting the single branch along which the root was placed). Since it has no branch connecting it to a parent, it differs from other internal nodes in having only two branches connected to it (instead of three, or more in the case of polytomies). The end results of rooting along a branch is that you add a node to the phylogeny and the root is resolved (not a polytomy).

Things are a bit different if you root at an existing internal node (Figure \@ref(fig:trees-rooted-abstract)B-C). Because the existing node becomes the root, the number of nodes in the tree remains unchanged. So far so good. But since internal nodes in a bifurcating tree all have three branches connected to them, when an internal node becomes the root the root is a polytomy. This seems like a pain, so why not always root along a branch? There are a few reasons. One is that rooting along a branch requires that we pick a specific point along the branch where the root goes, for example in the middle or somewhere else. That decision can take information that we don't have. Another reason is that the creation and destruction of nodes associated with rooting along branches gets cumbersome and problematic, especially when there are specific data associated with internal nodes.

What information can we use to root a phylogeny? There are a couple approaches. One is to pick the midpoint -- the point farthest from any tips -- as the root. If evolution proceeded at a perfectly uniform rate this could work well, but in practice rates of evolution are too variable across lineages for this to give a reliable result.

The more common approach to rooting a phylogeny is to use an outgroup (Figure \@ref(fig:trees-rooting)). If the ingroup is the group of organisms you are interested in (e.g., mammals), the outgroup is a set of animals that you strongly believe do not fall within the ingroup. If you place the root anywhere in the outgroup, then the most recent common ancestor of the ingroup will be the root of the ingroup. Rooting this way works better when a larger number of outgroup species are considered, and the outgroup species include the organisms most closely related to the ingroup. Including too few outgroups is one of the most common mistakes in published phylogenies.


![(\#fig:trees-rooting)The root of the mammal tree is shown in black. (A) Unrooted layout. (B) Rooted layout. (C) Rooted layout, including outgroup. The root for the whole tree, shown in gray, is placed in the outgroup. The node where the ingroup is attached to the rest of the tree is the ingroup root. In this case, that is the black mammal root.](phylogenetic_biology_files/figure-latex/trees-rooting-1.pdf) 

Always be careful interpreting root position when looking at a published phylogeny. Unrooted phylogenies are often drawn is if they are rooted, often by picking a random rooting point or making a good guess of where the root is. This is in part because rooted phylogeny figures tend to be easier to read than unrooted figures. If the figure legend or text doesn't state how the tree was rooted, best to assume that it wasn't rigorously rooted if this is critical to the analyses at hand.


## The information contained in phylogenies

Thinking about phylogenies as graphs gives us very explicit ways to think about what information can be contained in a phylogeny. In the fundamental graphical sense, a phylogeny is a pair of sets -- a set of nodes and a set of branches -- and annotations of those entities.

The topology of the phylogeny is the way in which nodes are connected by branches. If there are different connections in two phylogenies, then they have different topologies. If the annotations differ but the connections are the same, then the topologies are the same. Sometimes we know more and sometimes less about the topology. A fully resolved bifurcating phylogeny, where every internal node has two children, contains maximal information about the topology. A completely unresolved star phylogeny contains no information about topology.

Node annotations can include:

- Labels. On tip nodes these could be species names, gene names, or museum accession numbers for particular specimens. For internal nodes, they could be clade names (eg Mammalia).

- Character states. The presence or absence of particular attributes (like hair), or the particular nucleotide at a particular spot in a particular gene (CGTA). Often the character states for tip nodes are observed from data and the states of internal nodes are estimated. There are exceptions, though. One can, for example, estimate the states of tips for which no observations are available.

- Geographical locations.

- Whether the node is the root.


Branch annotations can include:

- Length. The value and unit of length can differ, for example it can time (as in a chronogram) or expected amount of change in a particular set of characters (as in a phylogram).

- Directionality. An indication of which direction time goes in along each branch. This only applies in the context of a rooted phylogenies.

- Events. These could include a character change (such as the gain of a placenta) or a geographical change (such as an intercontinental dispersal event). Nodes at eache end of a branch need not be different in the relevant trait to have change events along the branch. For example, at a particular gene site a parent and a child node could both have an A. There could be two or more events along the branch that are compatible with this pattern, for example a change from A to C and then a change from C back to A.

- Branch frequencies. This is how topology support values, such as bootstraps and posterior probabilities (which we'll discuss later), are stored.

Not all phylogenies have all this information. The minimum possible information a phylogeny could contain is just the number of tips. With this, you could draw an unresolved, unlabeled cladogram (Figure \@ref(fig:trees-information)A). You could then start layering information onto that phylogeny. For example, you could next add images denoting the species at the tips (Figure \@ref(fig:trees-information)B). That tells you what species are in the phylogeny, but nothing about how they are related. Next you could add internal nodes and branches that indicate the topology of the phylogeny (Figure \@ref(fig:trees-information)C). Once you have topology, you could display branch attributes. For example, you could scale the branch lengths by time (Figure \@ref(fig:trees-information)D).

At each step in this process of layering on information, the phylogeny is compatible with a very large set of possible phylogenies. At one extreme, Figure \@ref(fig:trees-information)A is compatible with any phylogeny with any branch lengths for any 11 species or organisms or genes. Each added piece of information narrows that subset. When we label the tips as in Figure \@ref(fig:trees-information)B, it is compatible with any phylogeny with any branch lengths for those specific species. And so on. More information provides more specificity. We could go well beyond Figure \@ref(fig:trees-information)D, for example by labeling internal nodes or showing character states.

The amount of information in a phylogeny varies greatly depending on a variety of factors, including what information is available, what the question at hand is, and what makes the most sense for the focused description of the biology at hand. One investigator may go to great lengths to calibrate branch lengths, for example, while another couldn't care less about branch lengths and is only interested in topology.

![(\#fig:trees-information)Adding information to a phylogeny makes it more specific.](phylogenetic_biology_files/figure-latex/trees-information-1.pdf) 


## Representation

So far we have focused on phylogenies in the abstract sense as mathematical graphs and their associated annotations, and in the concrete sense as tree-like drawings that represent these relationships. To work with trees of any significant size, we need to also represent them computationally. How can you store and manipulate a whole tree and all its associated annotations?

One way is to store a text representation of the tree. This is conveneint because text files are easy to work with, and can be viewed and edited with a variety of existing text editors. Newick, a phylogenetic data format ironed out over dinner at [Newick's Lobster House](https://www.yelp.com/biz/newicks-lobster-house-dover), does exactly this. The newick format is widely used for storing phylogenies in text files, and is supported as a way to read and write trees by almost every phylogenetic software tool. The basic idea is to designate each clade within a pair of parentheses.


```r
# Define the newick text that includes the tip labels and 
# tree topology
newick_text = "(((A,B),(C,D)),E);"

# Create an ape phylo object from the tree text
phylo_tree = read.tree( text=newick_text )

# Plot the newick_tree phylo object using the ggtree library
# Draw the tree
ggtree(phylo_tree ) +
  # Add the node numbers
  geom_text2(aes(label=node), col="gray", nudge_x=0.1 ) +  
  # Add the tip labels
  geom_tiplab( aes(label=label), offset=0.3, col="black") +
  # Add points on nodes
  geom_nodepoint(col="gray") +                              
  geom_tippoint(col="gray")
```

![(\#fig:trees-newick)Defining and drawing a Newick tree. Tip labels (letters) are black, nodes and node numbers are gray, and branches are black.](phylogenetic_biology_files/figure-latex/trees-newick-1.pdf) 

In Figure \@ref(fig:trees-newick), you can see how to define a newick tree, convert it to 
a different type of representation, and then draw that. Most of the figures in this text were 
made using similar code.

Considering just the newick specificaiton of the tree, `"(((A,B),(C,D)),E);"`, you can see it built up as a series of clades. The inner-most sets of parentheses define two clades, `(A,B)` and `(C,D)`. The next set of parentheses out indicates that these two clades together form a larger clade, `((A,B),(C,D))`. Finally, the outermost parentheses indicate that the clade `((A,B),(C,D))` is sister to `E`. Commas separate sisters within clades, and the whole thing is finished off with a semicolon. The format also allows for labels of internal nodes, and the specification of branch lengths. Joe Felsenstein wrote an interesting [description and history](https://evolution.genetics.washington.edu/phylip/newicktree.html) of the newick format, which includes details on how to store other types of information in the file format.

As versatile and simple as newick is for storing trees in files, it isn't great for storing trees in computer memory where you want to do things with them. To build and analyze trees it is better to have a format that has a more direct representation of nodes, branches, and their annotations. This allows us to directly encode the information noted in the section [The information contained in phylogenies], and to readily extend the data objects as needed.

The most widely used format for storing phylogenies in the R programming language is as a `phylo` object from the excellent `ape` library [@R-ape]. The ` read.tree() ` function in the code block above creates a `phylo` object called `phylo_tree` based on the phylogeny we specified as text and named `newick_tree`. In a `phylo` object, each node of a phylogeny has a unique number. The first consecutive node numbers, from 1 to $n$ where $n$ is the number of tip nodes,  are allocated to the tip nodes. The internal nodes are numbered consecutively from there, which in a bifurcating tree will be nodes $n+1$ to $2n-1$. The assignment of the node numbers within these ranges is arbitrary, there is no guarantee for example that the same internal node will ahve the same number each time the tree is read. The numbers of the nodes that were given when we created the `phylo` object from the newick text are shown in red in Figure \@ref(fig:trees-newick).

Below we take a quick peek inside the `phylo` object we created above. The intent isn't to learn how to manipulated trees in R quite yet, but to just show you how trees can be stored in computer memory. First, let's take a look at the structure of the `phylo` object to see what variables it contains within it:


```r
str( phylo_tree )
```

```
## List of 3
##  $ edge     : int [1:8, 1:2] 6 7 8 8 7 9 9 6 7 8 ...
##  $ Nnode    : int 4
##  $ tip.label: chr [1:5] "A" "B" "C" "D" ...
##  - attr(*, "class")= chr "phylo"
##  - attr(*, "order")= chr "cladewise"
```

We can see that there are three slots (each designated with a `$`) within this `phylo` object. `Nnode` is just the number of internal nodes. The real magic is `edge`, which encodes the topology of the tree. It is just an array with one row per edge (*i.e.*, branch), and two columns. The value in column 1 is the number of the node that is the parent of the branch, and the value in column 2 is the number of the node that is the child of the branch. Here are the complete contents of the `edge` slot:



```r
phylo_tree$edge
```

```
##      [,1] [,2]
## [1,]    6    7
## [2,]    7    8
## [3,]    8    1
## [4,]    8    2
## [5,]    7    9
## [6,]    9    3
## [7,]    9    4
## [8,]    6    5
```

So, in this case edge number 1 (the first row) connects node $6$ to node $7$. Indeed, we can see just such an edge in Figure \@ref(fig:trees-newick). Try to identify each of the other branches in the array in the tree figure.

You can discern all sorts of things about the tree from this simple array. The tips are nodes that are in column 2 but not in column 1 (since they aren't parents of any other nodes). The root is the node that is in column 1, but not in column 2 (because it doesn't have a parent). If a node occurs in column 1 more than twice, then it is a polytomy (because it has more than two branches connecting to child nodes). Note that this data structure is intrinsically rooted - there is a parent-child relationship set up between the nodes at each end of each edge. But you can still use it to store unrooted trees by picking an arbitrary internal node as the root, and just keeping track of the fact that you don't know where the root is.

There is one other important piece of information that we specified in the newick files - the tip labels. Those are located in another slot within the `phylo` object:


```r
phylo_tree$tip.label
```

```
## [1] "A" "B" "C" "D" "E"
```

We can see that this is just a vector of labels. They correspond to the labels of nodes one through five, all the tip labels, in consecutive order.

That's it. That's all the information we specified in the newick file, all the information in the `phylo` object, and all the information that is needed to draw Figure \@ref(fig:trees-newick). The newick tree is easy to store and manipulate with simple text tools, the `phylo` object is a powerful and flexible way to represent the tree in computer memory, and the figure is easy to read at a glance.


## Additional reading

- I used `ggtree` [@R-ggtree] to draw the trees in this chapter. If you are interested in learning more about these tools, see:

- The ggtree book - https://yulab-smu.github.io/treedata-book/index.html

- ggtree vignettes - https://bioconductor.statistik.tu-dortmund.de/packages/3.1/bioc/vignettes/ggtree/inst/doc/ggtree.html

<!--chapter:end:phylogenies.rmd-->

---
output:
  pdf_document: default
  html_document: default
---
# Simulation

Here we will build the machinery to implement models of DNA evolution. Our first 
application of these models will be to simulate data.


## Models

Models are representations of processes. They are abstractions in the sense that they leave out things that aren't thought to be important, and they are idealized in the sense that they are deliberately simplified [@godfrey2016philosophy, 21].

For some applications, it doesn't 
matter if model structure reflects actual underlying 
processes, as long as it generates useful output [@breiman2001statistical].
For example, if data scientists at a large retail chain are trying to predict how much toothpaste they 
need to stock at each store, they likely don't care if their models properly consider 
purchasing rates and all the other things that impact stock, so long as the 
the model does a reasonable job of making useful 
predictions. In science, though, we often care very much about the model because 
many of our questions have to do with the mechanisms that underlay the processes 
we are modeling. We don't just want models that give us the right answer, we often 
want models that give us the right answer for the right reasons.

Statisticians often note that "All models are wrong but some 
are useful", a common aphorism expanded from a quote by @box1976science. 
The goal of a model isn't to be "right" in the sense of being a perfect explanation of 
data. Real data are far too complex for any model to do this. Instead, the most useful models strike a trade-off between simplicity and adequacy. They are 
as simple as possible, while adequately describing the phenomenon of interest. Adequacy is often 
in the eye of the beholder -- one scientist will be perfectly happy with a model that makes reasonable 
rough approximations of a system, another scientist may be interested in second and third order effects 
for which more complexity is needed for adequate explanation.

Cartography is an interesting analogy for the way we will use statistical models. A "perfect" map would basically 
be a copy of the whole world, which wouldn't be that much more useful than the world itself already is for many 
of the things you would like to do with a map. So all maps are simplifications (Figure \@ref(fig:sim-maps)). The simplification is often what makes the map useful. 

\begin{figure}
\includegraphics[width=5in]{figures/maps} \caption{Four maps of the Yale campus, varying in complexity and focus. (A) A satellite image of New Haven, including much of Yale campus, from Google Maps. This image has a very large amount of information. (B) A street map of the same region, also from Google Maps. It has less information, but is more useful for some tasks such as navigation. (C) An even more simplified map, focused on showing the Yale Shuttle routes. (D) The New Haven property map of the region around Osborn Memorial Laboratory, showing property lines and plot numbers. Like (C) it is simple, but reflects different decisions about which information to discard or retain. This figure is inspired by the London maps that David Swofford uses in his own talks to make the same points.}(\#fig:sim-maps)
\end{figure}

Let's examine one of the most common models, the linear model:

\begin{equation}
  y = mx+b
  (\#eq:linear)
\end{equation}

Here, $y$ and $x$ are variables. The model posits a linear relationship between $x$ and $y$. If you plot their correspondence in a plane 
you will get a line. $m$ and $b$ are model parameters. $m$ is the slope of the line. It captures how much change there is in $y$ for each unit of change in $x$. $b$ is the intercept. It is the value of $y$ when $x=0$.

![(\#fig:sim-linear)A linear model with $m=0.5$ and $b=1$.](phylogenetic_biology_files/figure-latex/sim-linear-1.pdf) 

There are a variety of useful things we could do based on these relationships between the model, model parameters, and values. Let's consider $x$ to be a variable that tell us something about the past and $y$ to be a variable that tells us something about the present or future. Use cases then include:

- If we clamp the model (linear) and model parameters (specific values of $m$ and $b$) according to prior knowledge, and clamp $y$ according to observed data, we can estimate $x$. In this case the model is like a time machine that allows us to look into the past.

- If we clamp the model (linear) and variables ($x$ and $y$) according to prior knowledge, we can estimate model parameters $m$ and $b$. In this case the model is like an instrument that allows us to peer inside processes based on their inputs and outputs.

- If we clamp the model (linear) and model parameters (specific values of $m$ and $b$) according to prior knowledge, and clamp $x$ according to observed data, we can estimate $y$. In this case the model is like an oracle that predicts the future.

- If we clamp the model (linear) and model parameters (specific values of $m$ and $b$) according to prior knowledge, and clamp $x$ according to values we make up, we can simulate $y$. In this case the model is like a world-builder that tells us what we would expect to see under the specified conditions. This is very helpful for getting a sense of whether our models are working well (Do they generate results that look like what we see?), examining counterfactual situations that don't exist, or building datasets to test software tools.

There are some deep connections here. For example, predicting the future is basically just simulating the future based on our model and what we already know about the past and present.

The models that we will use in phylogenetic biology tend to be more complex than the linear mode, but this general perspective of clamping and estimating different things still holds.


## A simple model of evolution

Let's start with a simple model of DNA evolution. At first we will also consider only a single nucleotide position along a single branch in a phylogeny (Figure \@ref(fig:sim-application)). The goal is to build an intuitive integrated understanding of the mathematical and statistical relationships among:

- Model structure
- Model parameters
- Branch length
- State at the start of the branch (the nucleotide at the parent node)
- State at the end of the branch (the nucleotide at the child node)


\begin{figure}
\includegraphics[width=4.72in]{figures/applications} \caption{Our current goal is to model the evolution of a single site in a DNA sequence along a single branch in a phylogeny. (A) An example phylogeny, with DNA sequence fragments shown at the tips and one internal node. The site under examination is in color, and the branch under examination (at the top) is thicker than the rest. (B) A closeup of the focal branch, and the state of the focal site at its ends (the parent and child nodes). (C) Multiple mutational histories that are consistent with the starting and end states shown in (B), *i.e.* a cange from A to C.}(\#fig:sim-application)
\end{figure}

Imagine that when the DNA is being replicated, most of the time the appropriate nucleotide is incorporated. Some fraction of the time, at rate $\mu$, an event occurs where the appropriate nucleotides is replaced with a random nucleotide instead. In our model, the probability of selecting any of the nucleotides during one of these random replacement events is uniform (picking a C is just as probable as picking a G, for example), and the new nucleotide doesn't depend in any way on what nucleotide was there before. It is as if you had a bag containing a large number of C, G, T, and A nucleotides at equal frequencies. As you built the new DNA strand, every so often you would replace the nucleotide you should be adding with one you instead select by reaching into the bag and picking at random.

Not all replacement events will result in an apparent change. Sometimes the appropriate nucleotide is selected by chance, even though it was picked at random. If, for example, the appropriate nucleotide was an A, under this model $1/4$ of the time a replacement event occurs, an A is selected by chance and there is no apparent change. In such a case, there has not been a substitution, just a replacement in kind. If the A is replaced with any of the other three nucleotides we say there has been a substitution. Because three of the four possible outcomes of a replacement event result in a substitution, the substitution rate is $(3/4) \mu$. Because some events result in no apparent change, substitutions are only a subset of events and the substitution rate is *lower* than the replacement rate.

It might seem a bit odd to consider replacement events that don't result in substitutions, but this follows naturally from a central feature we specified for the the model - the new nucleotide doesn't depend in any way on what nucleotide was there before. If we had a process where replacements always resulted in substitutions, then excluding the replacement-in-kind events would require knowing which nucleotide should be placed so that we *don't* select it.

### Expected amount of change

For the simple process described here, there are two things to consider if we want to know the amount of evolutionary change. The first is the rate $\mu$, and the second is the time over which the evolutionary process acts. In our example here, that time is the length of the branch under consideration in the phylogeny.

In Figure \@ref(fig:sim-jc-mu-sweep) each horizontal bar is a simulation over the same time interval (0-100 time units). Each black line on the bar is a replacement event randomly introduced by the computer according to our model. We use a different value of $\mu$ for each simulation (as indicated on the vertical axis). In the bottom bar, where $\mu=0$, there are no replacements (black bars) and therefore no substitutions (the whole bar is the same color). There are more replacement events as $\mu$ increases along the vertical axis.

![(\#fig:sim-jc-mu-sweep)Each horizontal bar is a simulation of evolution of a single nucleotide position through time, $t$, for a specified value of $\mu$. Each simulation starts out as an A. Black vertical lines correspond to replacement events, which don't all lead to substitutions (a new color). ](phylogenetic_biology_files/figure-latex/sim-jc-mu-sweep-1.pdf) 

As $\mu$ increases (going up on the vertical axis), the number of replacement events over the same time interval increases (Figure \@ref(fig:sim-jc-mu-n)). This reflects the simple linear relationship $n=\mu t$, where $n$ is the number of expected replacement events.

![(\#fig:sim-jc-mu-n)The number of replacement events increases linearly with the replacement rate $\mu$. This plot is from the same simulation as that shown in Figure \@ref(fig:sim-jc-mu-sweep). The line is a linear model fit to the data. Since $n=\mu t$, and in this case $t=100$, the slope of $n$ on $t$ is estimated to be near 100.](phylogenetic_biology_files/figure-latex/sim-jc-mu-n-1.pdf) 

Because of the linear relationship between the number of replacements and the product $\mu t$, rate ($\mu$) and time ($t$) are conflated. In many scenarios you can't estimate them independently. If there are a small number of replacements, for example, you can't tell if there is a low rate over a long time interval, or a high rate over a short interval. Both would give the same resulting number of changes $n$. Because rate ($\mu$) and time ($t$) are so often confounded in phylogenetic questions, often the rate is essentially fixed at one and the unit of time for branch lengths is given as the number of expected evolutionary change rather than absolute time (years, months, etc). You will often see this length as the scale bar of published phylogenies (Figure \@ref(fig:sim-tree-cnid)). The exception is when you have external information, such as dated fossils, that allow you to independently estimate rates and branch lengths in terms of actual time. Sometimes deconfounding $\mu t$ isn't important to the primary question of the investigator, sometimes it would be nice to know but can't be done, and other times (such as in papers that date trees) it *is* the central question.

\begin{figure}
\includegraphics[width=4.9in]{figures/Fig_cnidaria} \caption{A published phylogeny [@zapata2015] with a scale bar indicating branch length in terms of the expected amount of evolutionary change, rather than absolute time.}(\#fig:sim-tree-cnid)
\end{figure}

### Expected end state

The machinery above shows how a model can clarify the way we think about the expected amount of change along a branch. Many times, though, we want to know what the probability of a given end state is given a starting state, a model, and the amount of time elapsed. One way to anchor such a  question is to think about the extremes - what do we expect after a very small amount of change (either a short time or a slow rate of change, or both), and what do we expect after a large amount of change?

The situation is most clear after a small amount of change (when $\mu t$ is small) - we expect the end state to be the same as the starting state. If we start with an A, for example, if there is very little change we expect to end with an A (Figure \@ref(fig:sim-saturation), left side). In this situation, the starting state tells us a lot about the end state. Not much else matters.

What should we expect, though, if there has been a large amount of change (when $\mu t$ is large)? Can we know anything at all? It turns out that we can. If there have been many replacements, one after the other, than the initial starting state doesn't matter because whatever was there initially will probably have been replaced multiple times. It is as if had been erased and written over. If the starting state doesn't contain information about the end state, what does? 

Since replacements are coming from the bag that you are picking the nucleotides at random from, that bag has information about the expected states after a large number of changes. Given enough evolutionary time, our simple model will lead the expected frequency of each nucleotide in the evolving sequence to be the same as their frequencies in the bag. Since we specified that you have the same chance of grabbing any nucleotide from the bag, eventually the probability of having each of the our nucleotides is the same, 25% (Figure \@ref(fig:sim-saturation), right side). If you started with a sequence that had an A and let it evolve 100 times, after enough evolutionary time had passed to reach equilibrium you would expect to get 25 C's, 25 G's, 25 T's, and 25 A's.




![(\#fig:sim-saturation)Stacked bar plots indicating the frequency of each nucleotide after simulated evolution for a specified amount of time. The rate of evolution is $\mu=0.050$. There are 1000 replicate simulations for each value of time. At time $t=0$ (no evolution), the end result is always the same as the initial value, which is fixed at A in these simulations. As the length of time increases, the four nucleotides converge on equal proportions of 0.25 each.](phylogenetic_biology_files/figure-latex/sim-saturation-1.pdf) 

### Analytical approach

In all the examples above, I simulated replacement events by randomly generating them at the specified rate. To get the end state, I then just retained the last state. You could take this approach to assessing the probability of different outcomes in actual analyses, but it gets very computationally expensive. It would be better to have an equation to solve for the probabilities directly. That isn't always possible for a model, but it is in this case.

The process of change that our simple model describes is similar to compound interest. 
We have something in hand, apply a process to it, then take the output and apply that same process again. Over and over. 
In the case of compound interest, that something is money and the process is growth. In the case of our model, the 
something is a DNA site and the process is mutation. In both cases, we take as inputs a starting state, a rate of change, and an amount of time, and as an output get the expected end state. To get the expected end state as a function of time elapsed, given a rate of change, we can use exponential functions. For example, here is the exponential function for calculating a balance at time $B(t)$ given the initial balance $B_0$ and an interest rate $r$:

\begin{equation}
  B\left(t\right) = B_0 e^{r t} 
  (\#eq:sim-interest)
\end{equation}

For our sequence evolution model, we need two exponential functions [@swofford1996molecular]:


\begin{equation}
  P\left(t\right) = \frac{1}{4} + \frac{3}{4} e^{-\mu t} 
  (\#eq:sim-stay)
\end{equation}

\begin{equation}
  P\left(t\right) = \frac{1}{4} - \frac{1}{4} e^{-\mu t} 
  (\#eq:sim-change)
\end{equation}


Equation \@ref(eq:sim-stay) shows the probability of the final state being the same as 
the beginning state. So if you start with an A, this would give you the probability 
of remaining an A after time $t$ given a specific value of $\mu$. Equation \@ref(eq:sim-change) is the probability of each of the three end states that are different from the starting state. If you start as an A, this is the probability of changing to a G, for example. It is also the rate of C to T, G to A, *etc*...

Consider what happens to these equations in the extremes we considered above when examining Figure \@ref(fig:sim-saturation). If $\mu$ or $t$ are zero, we expect no change (Figure \@ref(fig:sim-analytical), left side). In that case we get $e^0$, which is 1. Equation \@ref(eq:sim-stay) becomes $1/4 + 3/4$, which is 1. So there is a probability of 1 that, after no change, the end state is the same as the beginning state. Likewise, Equation \@ref(eq:sim-change) becomes $1/4 - 1/4$, which is 0. So after no change the end states that differ from the beginning state each have probability 0.

Now consider the case after infinite change (or just a large amount of change, as in the right side of Figure \@ref(fig:sim-analytical)). If $\mu$ or $t$ are infinity, then $e^{-\mu t}$ becomes $e^{-\infty}$, which is 0. In that case, Equation \@ref(eq:sim-stay) becomes $1/4 + 0$, which is simply $1/4$. Likewise, Equation \@ref(eq:sim-change) becomes $1/4 - 0$, which is also $1/4$. So all the nucleotides (the one that you started with, and the three other states that substitution can lead to) all have the same equal frequency of $1/4$. This reflects the fact that the frequency of drawing each of these from the bag was $1/4$.

![(\#fig:sim-analytical)The probability of observing a particular end state at time $t$, given the start state A and $\mu=0.05$. The solid line is the probability of observing the original start state (as described by Equation \@ref(eq:sim-stay)), the dashed line is the probability of observing each of the three other states (as described by Equation \@ref(eq:sim-change)).](phylogenetic_biology_files/figure-latex/sim-analytical-1.pdf) 

We can reorganize things a bit (Figure \@ref(fig:sim-analytical)) to get a plot like that of Figure \@ref(fig:sim-saturation), but derived from Equations \@ref(eq:sim-stay) and \@ref(eq:sim-change) instead of from actual simulations of changes along branches. 

![(\#fig:sim-sat-analytical)Stacked bar plots indicating the frequency of each nucleotide after evolution for a specified amount of time. The rate of evolution is $\mu=0.050$. The starting state is set at A, so the probability of observing an A is described by Equation \@ref(eq:sim-stay). The other three nucleotides, C, G, and T, are described by Equation \@ref(eq:sim-change). At time $t=0$ (no evolution), the probability that the state is the same as at the start is 1.0. As the length of time increases, the four nucleotides converge on equal probability of 0.25 each.](phylogenetic_biology_files/figure-latex/sim-sat-analytical-1.pdf) 

Let's put this back into a biological context. Our simple model allows us to 
calculate the probability $P(t)$ of a given nucleotide state at the end (child node) of a branch given:

- The nucleotide state at the beginning (parent node) of the branch
- Replacement rate $\mu$
- Length of the branch $t$

This is powerful stuff. We could do a variety of things with this model machinery, for example:

- Simulate evolution along a branch by sampling nucleotides for the child node from this probability distribution
- Ask the probability of a given starting state given an end state
- Evaluate how reasonable our $\mu$ model parameter value is. If, for example, we have a tree with very short branches that had different states at their parents and children, we might be skeptical of a low $\mu$ value.


## Generalizing the simple model

The model we built above only has one parameter that can vary, $\mu$, so we can describe the model parameters very simply. This is convenient, but leaves some of the things that are happening under the hood a bit opaque. Let's rewrite this simple model in a way that makes it a bit clearer how we are using this parameter, and also reveals some other parameters that are there but that we ignored until now because they were clamped. First, we need to represent the model as a $4\times4$ rate matrix, which we will call $\mathbf{Q}$, as defined in Equation \@ref(eq:jc69). Each row corresponds to one of the four possible nucleotides (A, C, G, T, in that order from top to bottom), and each column corresponds to one of the four possible nucleotides (A, C, G, T, in that order from left to right). Each of the elements in the matrix is the instantaneous rate of change from the nucleotide of the corresponding row, to the nucleotide of the corresponding column. 

\begin{equation}
\mathbf{Q} = 
\left(\begin{array}{cccc} 
-3\mu\pi & \mu\pi & \mu\pi & \mu\pi\\
\mu\pi & -3\mu\pi & \mu\pi & \mu\pi\\
\mu\pi & \mu\pi & -3\mu\pi & \mu\pi\\
\mu\pi & \mu\pi & \mu\pi & -3\mu\pi\\
\end{array}\right)
(\#eq:jc69)
\end{equation}

Recall that $\mu$ is the rate of *any* replacement event happening. That replacement event could be an A, C, G, or T. Only three of these replacements lead to a substitution, since replacing with the original nucleotides does not lead to a change. To find the rate of *specific* replacements happening, as we need to do for the elements of this matrix, we need to apportion the total replacement rate $\mu$ to specific nucleotides. We can do that with a new term $\pi$, which is the name we will give to the equilibrium frequency of each state. This corresponds to the frequency of each nucleotide in the bag we randomly sampled from. In our simple model, $\pi=0.25$ for all nucleotides. Because $\pi$ was clamped and wasn't free to vary, it was essentially invisible in the way we previously described the model.

The off-diagonal elements of $\mathbf{Q}$ give the rates of substitutions, and are all $\mu \pi$. But what's up with the diagonal elements? We pick these diagonal elements to be whatever value leads the rows to sum to 0. The basic intuition of this is that we aren't creating or destroying nucleotides, just replacing them. So the net change needs to be 0. Since there are three substitutions in each row, and each substitution has rate $\mu \pi$, these diagonal elements are set to $-3 \mu \pi$. The negative rates for the diagonal elements can be thought of as a rate of leaving the current state, while the positive off diagonal rates correspond to entering new states.

There is a lot going in in $\mathbf{Q}$. To make sense of it all, it helps to factor it out into two parts [@swofford1996molecular]. The first is a $4\times4$ matrix $\mathbf{R}$, which has all the rates, and the second is a $4\times4$ matrix $\boldsymbol{\Pi}$ that has the equilibrium frequencies on its diagonal and 0 everywhere else (Equation \@ref(eq:jc69-expanded)).

\begin{equation}
\mathbf{Q} = \mathbf{R}\boldsymbol{\Pi} =
\left(\begin{array}{cccc} 
-3\mu & \mu & \mu & \mu\\
\mu & -3\mu & \mu & \mu\\
\mu & \mu & -3\mu & \mu\\
\mu & \mu & \mu & -3\mu\\
\end{array}\right)
\left(\begin{array}{cccc} 
\pi & 0 & 0 & 0\\ 
0 & \pi & 0 & 0\\
0 & 0 & \pi & 0\\
0 & 0 & 0 & \pi\\
\end{array}\right)
(\#eq:jc69-expanded)
\end{equation}

(This factoring is possible because of the way matrix multiplication works. For a refresher on matrix multiplication, [this video](https://www.youtube.com/watch?v=OMA2Mwo0aZg) explains how to do it operationally, and [this series of videos](https://www.youtube.com/watch?v=fNk_zzaMoSs&list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab) explains what it is actually doing.)

$\mathbf{Q}$ is the instantaneous rate matrix -- it specifies the particular amount of change we expect over a short period of evolutionary time. But as we discussed before, we often want to know the probability of ending with a particular state if you start with a particular state and let it evolve along a branch of a given length. Before, when we were keeping things as simple as possible, we used the exponential Equations \@ref(eq:sim-stay) and \@ref(eq:sim-change) for this. They took as input the overall replacement rate $\mu$ and the length of the branch $t$. Now we want a similar equation, but we want to provide the rate matrix $Q$ rather than the single parameter $\mu$. Again we can just use an exponential function, and it actually has a much simpler form.

\begin{equation}
\mathbf{P}\left(t\right) = e^{\mathbf{Q} t} 
(\#eq:jc69-prob)
\end{equation}

Raising $e$ to the power of a matrix like this is known as matrix exponentiation, and it returns a matrix with the same dimensions as the matrix in the exponent. This new matrix $\mathbf{P}(t)$ is therefore also a $4 \times 4$ matrix. As for $\mathbf{Q}$ and $\boldsymbol{\Pi}$, and $\mathbf{R}$, each row corresponds to one of the four possible nucleotides (A, C, G, T), and each column corresponds to one of the four possible nucleotides (A, C, G, T). Each of the elements in the matrix is the probability of going from the nucleotide of the corresponding row to the nucleotide of the corresponding column over a branch of length $t$. Given the single rate parameter and uniform equilibrium frequencies, the diagonal elements are each Equation \@ref(eq:sim-stay), and the off diagonal elements are each Equation \@ref(eq:sim-change).

Wow! This was a lot of work to write a really simple model in a much more complicated way. Now we can start to reap the rewards of describing this simple model in this form.

## Expanding the models

The mathematical, statistical, and computational machinery above describes the evolution of one DNA site along one branch in a phylogeny (Figure \@ref(fig:sim-application)) according to a simple model. In fact, this is the simplest possible model of DNA evolution, named JC69 after the folks who described it in 1969 [@jc1969]. It is only one free parameter -- the rate of evolution $\mu$. It is highly idealized -- there are many important facts about DNA and DNA evolution that we deliberately omit. 

The simplicity of JC69 makes it a useful starting place to understand how models of DNA evolution work, but it is too simple to be very useful in practice. There are many other biological aspects of sequence evolution we might want to consider, including that:

- The nucleotides C, G, T, and A are often not found at an equal frequency of 0.25 each. Since the nucleotides form base pairs in organisms with double stranded genomes, C and G are found at the same frequency and T and A at the same frequency. Furthermore, the frequency of the four nucleotides must add to 100%. Therefore, the frequency of all four nucleotides can be summarized with a single number, usually given as the GC content -- the percent of sites that are G or C. For example, the human genome has a GC content of 41%, which indicates nucleotide frequencies of 0.205 G, 0.205 C, 0.295 T and 0.295 A. This is quite different than the equal frequencies of 0.25 for all nucleotides expected by the JC69 model.

- The rates of mutation between different nucleotides is not the same. This is in part because some nucleotides are shaped more like others, and are more likely to be substituted for each other by mistake. In particular, A and G tend to be substituted for each other because they have two rings, and C and T tend to be substituted for each other because they have one ring. These changes between A/G and C/T are referred to as transitions. All other substitutions are called transversions, and are each less likely.

To accommodate each of these deviations from JC69, we need to add parameters to the model to explain the added complexity. There are all kinds of parameters we could add one by one, and in fact that is how the field proceeded in the decades after JC69 was described. Rather than build the models up in that way, though, it is actually easier to describe a general model that these other models, including JC69, are special cases of.

\begin{equation}
\mathbf{Q} = \mathbf{R}\boldsymbol{\Pi} =
\left(\begin{array}{cccc} 
- & \mu a & \mu b & \mu c\\
\mu a & - & \mu d & \mu e\\
\mu b & \mu d & - & \mu f\\
\mu c & \mu e & \mu f & -\\
\end{array}\right)
\left(\begin{array}{cccc} 
\pi_A & 0 & 0 & 0 \\
0 & \pi_C & 0 & 0 \\
0 & 0 & \pi_G & 0 \\
0 & 0 & 0 & \pi_T \\
\end{array}\right)
(\#eq:sim-gtr)
\end{equation}

(To keep things compact, I have followed the convention of placing $-$ in the diagonal elements, which is short for "whatever it takes to make the rows of $\mathbf{Q}$ sum to 0".)

This model (Equation \@ref(eq:sim-gtr)) is called the General Time Reversible (GTR) model of DNA sequence evolution. It is General because it has parameters that allow many things to vary independently. The $\pi_A ... \pi_T$ parameters allow the equilibrium frequencies to differ for each nucleotide. The $a ... f$ parameters adjust $\mu$ so that rates can differ. For example, the instantaneous rate of change from A to C can be different from that of A to G by setting $a$ and $b$ to different values. It is Time Reversible because we don't have different rate parameters for every single off-diagonal element, but instead mirror them. This means, for example, that the rates of change from A to C and from C to A are both the same, $\mu a$. There are a few motivations for this. It keeps the total number of parameters down. It also reflects what is observed biologically. And it means that we don't need to know the direction of time along a branch to calculate $\mathbf{P}(t)$. This last point is very important since we often don't know where the root of a tree is when we want to calculate these probabilities. It also turns out to be convenient and efficient for phylogenetic inference software tools to reroot phylogenies without changing these probabilities as they make calculations on phylogenies.

If we let all the parameters in the GTR model (Equation \@ref(eq:sim-gtr)) be free, it is quite complex. We would have to estimate them all from data. The alternative is to clamp some of them. In fact, by comparison of Equations \@ref(eq:jc69-expanded)) and \@ref(eq:sim-gtr), we can see that JC69 is a clamped version of GTR where $\pi_A=\pi_C=\pi_G=\pi_T=0.25$ and $a=b=c=d=e=f=1$. Only $\mu$ is left free in JC69.

There are a variety of other commonly used models that clamp these parameters in different ways, some leaving more freedom than others. Some that are widely used and have very specific biological motivation have their own names, like JC69 (the motivation for this model is that it is so simple). Examples of other named models include:

- HKY85 differs from GTR in setting some rate modifiers equal to each other so that there are two rates, $b=e$ for transitions (A to G, and C to T) and $a=c=d=f$ for transversions (all other changes). It still lets all the $\pi$ parameters vary independently.

- F81 differs from HKY85 in that it sets all the rate modifiers to 1, so that $a=b=c=d=e=f=1$. It is almost as simple as JC69, except that the $\pi$ parameters vary independently.

We now have a more complex model of DNA evolution that we can simplify by setting the parameters to equal each other and/or clamping them to specific values. It can accommodate much of variation observed in actual DNA sequence data. We could use it to simulate data just as we did in Figure \@ref(fig:sim-saturation), but taking into consideration things like unequal nucleotide frequencies and differences in rates of change between nucleotides. This is getting us much closer to something that provides real biological insight.

## Plugging some numbers into the expanded model

Now that we have a framework for specifying a model with unequal equilibrium frequencies and different rates of change between different nucleotide pairs, let's build a specific case of a model and use it to simulate some data. That means we need to pick some actual model parameters, plug them into $\mathbf{R}$ and $\boldsymbol{\Pi}$ to get $\mathbf{Q}$, and then exponentiate that to get $\mathbf{P}(t)$. We can then use that to simulate changes in a single nucleotide along a branch. This will be a mathematically grounded version of the schematic in Figure \@ref(fig:sim-application)B.

We are using a mammal tree, so let's pick some parameter values that roughly approximate what we see in mammals. Rather than set all the parameters independently, let's set up an HKY85 model, which accommodates non-uniform base frequencies and different transition/ tansversion ratios. First, we can clamp $\mu=1$. This basically just means the branch lengths will be in units of expected evolutionary change. Transitions (captured by parameters $b$ and $e$) are on the order of 4 times more frequent than transversions (captured by parameters $a$, $c$, $d$, and $f$) in mammals [@rosenberg2003]. So we will clamp $b=e=2$ and $a=c=d=f=0.5$. I picked these particular values (rather than others, such as 4 and 1) because they keep the mean of the off-diagonal entries in $\mathbf{R}$ to 1. 

Now we have the following values for $\mathbf{R}$:

\begin{equation}
\mathbf{R} =
\left(\begin{array}{cccc} 
- & 0.5 & 2 & 0.5 \\
0.5 & - & 0.5 & 2 \\
2 & 0.5 & - & 0.5 \\
0.5 & 2 & 0.5 & - \\
\end{array}\right)
\end{equation}

We won't specify the diagonal elements of $\mathbf{R}$ quite yet.

Now we need $\boldsymbol{\Pi}$. We noted earlier that humans have a GC content of 41%, so we'll use that. This gave the following entries for $\boldsymbol{\Pi}$:

\begin{equation}
\boldsymbol{\Pi} =
\left(\begin{array}{cccc}
0.295 & 0 & 0 & 0 \\ 
0 & 0.205 & 0 & 0 \\
0 & 0 & 0.205 & 0 \\
0 & 0 & 0 & 0.295 \\
\end{array}\right)
\end{equation}



Now we can calculate $\mathbf{Q}$ by multiplying $\mathbf{R}$ and $\boldsymbol{\Pi}$ and adjusting the diagonal so that the rows each sum to 0:


\begin{equation}
\mathbf{Q} = \mathbf{R\Pi} =
\left(\begin{array}{cccc} 
-0.6600 & 0.1025 & 0.4100 & 0.1475 \\
0.1475 & -0.8400 & 0.1025 & 0.5900 \\
0.5900 & 0.1025 & -0.8400 & 0.1475 \\
0.1475 & 0.4100 & 0.1025 & -0.6600 \\
\end{array}\right)
\end{equation}

This is our instantaneous rate matrix. From here on out I will switch from mathematical 
notation to computational representations, since we are doing more calculations. Here is what the contents of $\mathbf{Q}$ look like when outputted from R:


```
##         A       C       G       T
## A -0.6600  0.1025  0.4100  0.1475
## C  0.1475 -0.8400  0.1025  0.5900
## G  0.5900  0.1025 -0.8400  0.1475
## T  0.1475  0.4100  0.1025 -0.6600
```



Now we need to exponentiate $\mathbf{Q}$ it to get $\mathbf{P}(t)$, according to Equation \@ref(eq:jc69-prob). If we do that numerically, we need to specify $t$ before we do the exponentiation. So, for example, $\mathbf{P}(1)$ is:



```
##           A          C          G         T
## A 0.5913935 0.08066121 0.21187182 0.1160735
## C 0.1160735 0.49837662 0.08066121 0.3048887
## G 0.3048887 0.08066121 0.49837662 0.1160735
## T 0.1160735 0.21187182 0.08066121 0.5913935
```

The sum of each row of $\mathbf{P}(t)$ is 1 for any value of $t$, since our model doesn't create or destroy nucleotides. No matter which of the four nucleotides you start with, you have to end with one of the four nucleotides. This better demonstrates why we had to select diagonal values of the *rate* matrix $\mathbf{Q}$ so that each row in that matrix is 0 -- if we hadn't, then the row sums of $\mathbf{P}(t)$ would not be 1. 

Now that we can derive $\mathbf{P}(t)$, let's explore some of its properties. Let's first think about what happens when $t=0$. In this case, there is no time for evolution to occur and the resulting nucleotide should be the same as the starting nucleotide. Indeed, we see this is the case:


```
##   A C G T
## A 1 0 0 0
## C 0 1 0 0
## G 0 0 1 0
## T 0 0 0 1
```

The probability of going from A to A is 1 while the probability of going from any other nucleotide is 0. The same goes for all of the other nucleotides, giving ones on the diagonal and zeros everywhere else.

What if the branch is very long, say $t=100$?


```
##       A     C     G     T
## A 0.295 0.205 0.205 0.295
## C 0.295 0.205 0.205 0.295
## G 0.295 0.205 0.205 0.295
## T 0.295 0.205 0.205 0.295
```

In this case, each row has the exact same values. If you look closely, they should be familiar -- they are the equilibrium frequencies from $\boldsymbol{\Pi}$. This matches what happened in Figures \@ref(fig:sim-saturation) and \@ref(fig:sim-analytical). As branch length increases, the expected frequencies of each nucleotide deviate further and further from the original state and approach the equilibrium frequencies specified by $\boldsymbol{\Pi}$.

## Simulation along a single branch

We can now calculate the probability of a specific end state given a start state. Now let's use this machinery to simulate evolution along a single branch at a time, as in Figure \@ref(fig:sim-application)B. 

We first need to set the state at the parent node. There are a couple approaches we could use to set the parent state. We could clamp it to a specific initial state, just as we did in our JC69 simulations when we set the starting state to A (Figure \@ref(fig:sim-jc-mu-sweep)). Alternatively, we could pick the starting state at random. 

How do we select a starting state at random? We could draw the starting state from a bag with equal frequencies of each nucleotide (as we did at the beginning of this chapter), but our model allows us to make a more informed selection than that. We implemented $\boldsymbol{\Pi}$ because we wanted to describe cases where the nucleotides do not occur at uniform frequencies, so let's draw from that distribution instead. For the toy mammal model we made above, that is 0.205 G, 0.205 C, 0.295 T and 0.295 A. We just sample a single nucleotide from this probability distribution. 



Table: (\#tab:sim-single-edges)Each row is simulated evolution along a single edge.

Parent       Length  Child 
-------  ----------  ------
A         0.0387691  A     
A         0.3444866  A     
C         0.6561006  A     
C         0.6723020  C     
A         0.5311025  A     
A         0.7477842  G     
T         1.7042348  T     
A         0.6896113  G     
G         0.7347406  G     
G         1.3263353  G     

In Table \@ref(tab:sim-single-edges) I selected the Parent nucleotide by sampling from $\boldsymbol{\Pi}$ as described above. I then created a random branch length $t$ by sampling from a uniform distribution that ranges from 0 to $2$, just to get a variety of branch lengths. I then simulated the Child state by sampling from $\mathbf{P}(t)$ given $t$ and the Parent state.



## Scaling from a single branch to a whole tree

So far we have considered the evolution of one DNA site along one branch at a time (Figure \@ref(fig:sim-application)B, Table \@ref(tab:sim-single-edges)). We will now expand to a whole tree, keeping our focus for now on simulation. Our goal is to use the model to simulate the evolution of a single site along all branches, generating a specific nucleotide state at each node. We will use the same toy mammal model as above. We will consider a simplified tree (Figure \@ref(fig:sim-tree)) rather than the full mammal tree, just to keep things compact.

![(\#fig:sim-tree)Simulation of states for a single DNA site on a simple tree according to our toy mammal model. Node numbers are in gray. Character states are in boxes at nodes. Branch lengths for this phylogram are in units of expected change.](phylogenetic_biology_files/figure-latex/sim-tree-1.pdf) 

This isn't a big step from what we have already -- once we have all the machinery to simulate along a single branch, we can just iterate that to simulate evolution along a whole tree.

Let's start with the root of the tree (Figure \@ref(fig:sim-tree), node 5). As in our simulations along single branches, we will pick the state from the equilibrium frequencies $\boldsymbol{\Pi}$. That gives us the $A$ at the root in Figure \@ref(fig:sim-tree). The root node is the parent of two branches that descend from it. These two branches connect to node 6 (the most recent common ancestor of the clade `(Species_A, Species_B)`) and node 7 (the most recent common ancestor of the clade `(Species_C, Species_D)`). We simulate the states for these child nodes according to the state at the root (node 5), length $t$ of each branch, and $\mathbf{P}(t)$. In each case, this is just as when we simulated evolution along a single branch at a time, it is just that the branches share a parent node so the also share a parent state.

There are four more branches in this tree, each connected to a terminal node. One branch has parent node 6 and child node 1 (which is the `Species_A` terminal node). Now that we are not at the root things are a little different. Rather than draw the state for the parent node from $\boldsymbol{\Pi}$, we just use the state that was simulated along the branch connecting node 5 to node 6. This state is $A$. Now we simulate evolution along the branch connecting node 6 to node 1, given the state at node 6, length $t$ of the branch, and $\mathbf{P}(t)$. We then do the same for each of the other branches.

Data can be simulated on a tree of arbitrary size in this way. Just sample from $\mathbf{P}(t)$ for the root state. Then traverse the tree from the root to each of the tips, simulating the state at each of the other internal nodes and finally the terminal nodes according to the states of their parents, branch length $t$, and $\mathbf{P}(t)$.

## Scaling from a single site to multiple sites

So far we have considered evolution at a single DNA site across a whole phylogeny. Genomes have from thousands to billions of sites, though. Here we expand our simulations from a single nucleotide at a time to arbitrarily long DNA sequences.

How? With one simplifying assumption -- that the evolution of each site is independent of the evolution at other sites. We just simulate one site at a time, and then stick all the results together into a sequence. 

## Concluding thoughts

Here we have built up the conceptual, mathematical, statistical, and computational machinery to simulating DNA evolution on a tree. Sequence simulation is useful for a variety of things, including generating datasets under known conditions to test tools. A major value, though, is to to think in a full explicit way about how you are modeling evolution. This probabilistic model framework is the exact same one we will use as we move to our next task, inferring phylogenies from sequence data. 


## Additional resources

- As a grad student, I learned much of what I present here from @swofford1996molecular. This is such a lucid introduction to the likelihood of molecular sequence data on a phylogeny.

- My own thinking about presenting this material was heavily influenced by Paul Lewis's wonderful lectures at the annual Workshop on Molecular Evolution at Woods Hole. Some of his lectures are now available online as part of the excellent Phylo Seminar at https://www.youtube.com/channel/UCbAzhfySv7nLCrNYqZvBSMg , starting with https://www.youtube.com/watch?v=1r4z0YJq580&t=2111s .

- A great introduction to continuous time models by John Huelsenbeck is available at  https://revbayes.github.io/tutorials/dice/ .


<!--chapter:end:simulation.rmd-->

# Inferring phylogenies from data

In the previous chapter we built modeling machinery that allowed us to specify a rate matrix $\mathbf{Q}$ (Equation \@ref(eq:sim-gtr)), and from that derive the matrix $\mathbf{P}(t)$  (Equation \@ref(eq:jc69-prob)) that gives the probability of a particular end state given the starting state and the branch length $t$. We used $\mathbf{P}(t)$ in a generative context, to simulate the evolution of a DNA sequence along the branches of a phylogeny.

We will now turn to using the same statistical framework for what may initially seem to be a very different task -- phylogenetic inference, where we infer the topology and branch lengths of a phylogeny from character data (DNA sequences, in this case). But these tasks are similar conceptually. The basic intuition is that you can infer a phylogeny by looking for the topology and branch lengths that are most probable to generate the observed data [@Felsenstein:1981vk].

This relationship between simulation and inference is widely used in a variety of fields. The probability of the observed data given a hypothesis is referred to as the Likelihood. Searching for the most likely hypothesis is referred to as Maximum Likelihood (ML).

## Probability of a single history

We will consider the toy phylogeny, along with its tip states, shown in Figure \@ref(fig:inference-toy).

![(\#fig:inference-toy)The toy phylogeny we will use to examine inference. Node numbers are in black. Branch lengths are gray numbers below branches. Tip node states are within boxes.](phylogenetic_biology_files/figure-latex/inference-toy-1.pdf) 

We will start be calculating the probability of a single history of evolution for a single site on a single phylogeny with specified topology and branch lengths. This history is a full set of states at all nodes. These are added to the toy phylogeny in Figure \@ref(fig:inference-internal-states). I want to emphasize that this isn't a history we have any particular reason to believe, it is just one possible history of states randomly chosen from all the possible histories.

![(\#fig:inference-internal-states)The same toy tree as above, but with arbitrary internal node states (in boxes).](phylogenetic_biology_files/figure-latex/inference-internal-states-1.pdf) 

Our goal now is to calculate the probability of each observed change. Recall that the matrix that contains these probabilities, given a starting state (rows), ending state (columns), and branch length $t$, is given by:

\begin{equation} 
  \mathbf{P}\left(t\right) = e^{\mathbf{Q} t} 
  (\#eq:prob)
\end{equation}

Where $\mathbf{Q}$ is the rate matrix. Let's plug some numbers in using the model we specified in the previous chapter. We don't have any specific reason to use this model on this tree, we are just sticking with it since we already built it.

Here is the relative rate matrix $\mathbf{R}$:


```
##     A   C   G   T
## A 0.0 0.5 2.0 0.5
## C 0.5 0.0 0.5 2.0
## G 2.0 0.5 0.0 0.5
## T 0.5 2.0 0.5 0.0
```

The equilibrium frequencies $\mathbf{\Pi}$:


```
##       A     C     G     T
## A 0.295 0.000 0.000 0.000
## C 0.000 0.205 0.000 0.000
## G 0.000 0.000 0.205 0.000
## T 0.000 0.000 0.000 0.295
```

And their product $\mathbf{Q}$, with the diagonal adjusted so that rows sum to 0:


```
##         A       C       G       T
## A -0.6600  0.1025  0.4100  0.1475
## C  0.1475 -0.8400  0.1025  0.5900
## G  0.5900  0.1025 -0.8400  0.1475
## T  0.1475  0.4100  0.1025 -0.6600
```

For each branch, we can now use $\mathbf{P}(t)$ to calculate the probability of a change from the start state at the parent node to the end state at the child node, given the branch length $t$. The results are shown in Figure \@ref(fig:inference-history). 


![(\#fig:inference-history)The same toy tree as above, but with probabilities of the specific change along each branch above each branch (in gray).](phylogenetic_biology_files/figure-latex/inference-history-1.pdf) 

Now that we have the probabilities of each of these changes, we can calculate the joint probability of all these changes. When we want to calculate the joint probability of multiple independent events, we take the product of the probability of each specific event. For example, the probability of rolling a 4 on a fair die is $1/6$. The probability of rolling two 4s on two fair dice is $1/6\times1/6=1/36$. So we can take the product of all the probabilities to calculate the joint probability of all of these events happening. 
We can think of these as the probabilities of specific changes along each branch as the probabilities of the state at each child node. 


 node   probability
-----  ------------
    1     0.7442034
    2     0.7442034
    3     0.3048887
    4     0.2260230
    5            NA
    6     0.0195083
    7     0.0652538

Note, though, that the probability for node 5, the root node, is missing. This makes sense since the root is not the child of any branch, and we calculated the probabilities based on changes along branches. We will therefore assess the probability of the root node state according to $\mathbf{\Pi}$, the equilibrium frequencies. This is the same approach we took when simulating data on a tree. When we fill that in our full set of probabilities is:


 node   probability
-----  ------------
    1     0.7442034
    2     0.7442034
    3     0.3048887
    4     0.2260230
    5     0.2950000
    6     0.0195083
    7     0.0652538

The joint probability of all these states can now be calculated as the product of each state. This comes out to $\ensuremath{1.4332602\times 10^{-5}}$. There are multiple ways to think about this probability. One is from a frequentist perspective. If we were to simulate character states on this tree, we would expect this full set of character states to occur at a frequency of $14.3$ times out of a million simulations.

Here we have used much of the same machinery as we did in the previous chapter, but toward a slightly different end. Rather than use the probability distributions to generate nucleotides in a simulation, we instead calculated the probability of a particular set of nucleotides. These may have seemed like very different tasks at first blush, but as you can now see their mathematical implementation shares many features.

## Probability of multiple histories

Above we considered the joint probability of a specific set of nucleotide states at all nodes, including both tip nodes and internal nodes. Usually, though, we don't know the internal node states. We don't even know what internal nodes exist, which is why we are trying to infer the phylogeny! Instead we have observed states that we got by sequencing organisms at the tips. We want to clamp these tip states and assess their probability on a particular tree (with branch lengths) under the model. This probability is independent of a specific history of internal node states. 

If we aren't clamping the internal node states as well, how can we calculate the probability of just the tip node states? The key is to consider all possible internal states. Each configuration of internal node states represents one possible history that gave rise to the observed tip states. We can sum the probabilities of each of these different ways to get the tip states to find the probability of the tip states over all possible histories. We are summing the probabilities because these are mutually exclusive histories that could give rise to the observed data. For example, if we want to find the probability of getting a total of seven when rolling two dice, we need to add up the probability of each way to get seven (1+6 *or* 2+5 *or* 3+4 *or* ... 6+1). This is different from when we multiplied probabilities to find the joint probabilities of multiple events occurring together (*e.g.*, the probability of rolling a 4 *and* another 4).

This is a small tree, with only 3 internal nodes that can each have 4 states. This gives $4^3=64$ possible histories. That is small enough to list them out below. I also include the probability of each specific history, calculated exactly as I did above (the example above corresponds to row 60 here).


n1   n2   n3   n4   n5   n6   n7    probability
---  ---  ---  ---  ---  ---  ---  ------------
T    T    A    C    A    A    A       0.0000451
T    T    A    C    C    A    A       0.0000048
T    T    A    C    G    A    A       0.0000036
T    T    A    C    T    A    A       0.0000035
T    T    A    C    A    C    A       0.0000000
T    T    A    C    C    C    A       0.0000025
T    T    A    C    G    C    A       0.0000000
T    T    A    C    T    C    A       0.0000002
T    T    A    C    A    G    A       0.0000005
T    T    A    C    C    G    A       0.0000005
T    T    A    C    G    G    A       0.0000044
T    T    A    C    T    G    A       0.0000004
T    T    A    C    A    T    A       0.0000000
T    T    A    C    C    T    A       0.0000003
T    T    A    C    G    T    A       0.0000000
T    T    A    C    T    T    A       0.0000019
T    T    A    C    A    A    C       0.0000282
T    T    A    C    C    A    C       0.0000030
T    T    A    C    G    A    C       0.0000023
T    T    A    C    T    A    C       0.0000022
T    T    A    C    A    C    C       0.0000018
T    T    A    C    C    C    C       0.0002699
T    T    A    C    G    C    C       0.0000013
T    T    A    C    T    C    C       0.0000164
T    T    A    C    A    G    C       0.0000012
T    T    A    C    C    G    C       0.0000011
T    T    A    C    G    G    C       0.0000097
T    T    A    C    T    G    C       0.0000008
T    T    A    C    A    T    C       0.0000006
T    T    A    C    C    T    C       0.0000069
T    T    A    C    G    T    C       0.0000004
T    T    A    C    T    T    C       0.0000432
T    T    A    C    A    A    G       0.0000088
T    T    A    C    C    A    G       0.0000009
T    T    A    C    G    A    G       0.0000007
T    T    A    C    T    A    G       0.0000007
T    T    A    C    A    C    G       0.0000000
T    T    A    C    C    C    G       0.0000018
T    T    A    C    G    C    G       0.0000000
T    T    A    C    T    C    G       0.0000001
T    T    A    C    A    G    G       0.0000017
T    T    A    C    C    G    G       0.0000016
T    T    A    C    G    G    G       0.0000142
T    T    A    C    T    G    G       0.0000011
T    T    A    C    A    T    G       0.0000000
T    T    A    C    C    T    G       0.0000002
T    T    A    C    G    T    G       0.0000000
T    T    A    C    T    T    G       0.0000013
T    T    A    C    A    A    T       0.0005139
T    T    A    C    C    A    T       0.0000552
T    T    A    C    G    A    T       0.0000415
T    T    A    C    T    A    T       0.0000400
T    T    A    C    A    C    T       0.0000071
T    T    A    C    C    C    T       0.0010512
T    T    A    C    G    C    T       0.0000050
T    T    A    C    T    C    T       0.0000638
T    T    A    C    A    G    T       0.0000214
T    T    A    C    C    G    T       0.0000198
T    T    A    C    G    G    T       0.0001776
T    T    A    C    T    G    T       0.0000143
T    T    A    C    A    T    T       0.0000366
T    T    A    C    C    T    T       0.0004512
T    T    A    C    G    T    T       0.0000255
T    T    A    C    T    T    T       0.0028111

Note that I listed the states for all the nodes, including nodes 1-4, which are clamped. It is the last three internal nodes (n5-n7) that have variable states. The probabilities for each specific history range quite widely, from $\ensuremath{8.2902428\times 10^{-9}}$ to $0.0028111$.

The sum of the probabilities for each of these different histories for n5-n7 that give rise to the observed clamped states for tip nodes n1-n4 is $0.0058252$. This probability of the data given a particular hypothesis (the topology, branch lengths, model, and model parameters) is the likelihood.

## Log likelihood

The likelihood of these data on this phylogeny, $0.0058252$, is not a big number. And this is a very small tree. As trees get larger there are many more probabilities we need to multiply, so the products get even smaller. The joint probabilities, in fact, get so small that computers have trouble storing them efficiently. Rather than store and manipulate the small probabilities directly, most tools take the natural logs of the probabilities, $ln(p)$. The log likelihood for this phylogeny is $-5.1455597$. Taking the log transforms probabilities to a numerical representation that is easier to work with. It also has the added value of making calculations of joint probability simpler. Given the relationship between the log of products of variables and the sum of logs of each value:

\begin{equation} 
  ln(a)+ln(b) = ln(ab)
  (\#eq:logs)
\end{equation}

We can calculate joint log probabilities as sums of log probabilities for each event, rather than as the log of products of the probabilities. Addition is much faster than multiplication for computers (since multiplication is a series of addition operations), so this speeds things up. For these reasons you will almost always see log likelihoods, rather than just likelihoods, published in the literature. Note that because likelihoods are probabilities and therefore range from 0--1, the log likelihoods will range from $-\infty$ (for probabilities very close to 0) to $0$ (for probabilities close to 1). Since likelihoods tend to be small, they end up as log likelihoods that are negative numbers with large absolute values.

## Likelihood for multiple sites

The machinery above gives us everything we need to calculate the log likelihood of a specific pattern of nucleotides across tips for a single site in a DNA sequence. We new need to expand this model from a single site to multiple sites within a gene or even across whole genomes.

This comes down to more of the same. We do everything we did above for each site, and then sum the log likelihoods across sites. This gives us the joint probability of observing the data seen across tips for each site in the DNA sequence. This joint probability for all sites will be much smaller than the probability for each individual site.


## Maximum likelihood

At this point we can calculate the log likelihood for specified phylogenies, models, and DNA sequences. But we set out to do phylogenetic inference, where we estimate phylogenies from sequences at tips. How do we get there from here? Once we can calculate the likelihood of a given phylogeny, we can calculate the likelihood of any phylogeny. We can then search for the phylogeny with the maximum likelihood (and, of course, maximum log likelihood).

The small toy phylogeny considered here (Figure \@ref(fig:inference-toy)) has four tip nodes. By reference to Equation \@ref(eq:ntrees), we can see that there are 15 possible topologies. For each, we can optimize the branch lengths to find the maximum likelihood for the topology. This is an iterative process, where each branch length is progressively refined until no change increases the likelihood. This excellent [interactive visualization](http://phylo.bio.ku.edu/mephytis/brlen-opt.html) allows you to manually optimize branch lengths on a small phylogeny. Then we pick the topology with the maximum likelihood. This requires a very large number of calculations, but is doable for every possible topology.

Things change very quickly, though, as trees grow in size. Beyond about 15 tips there are so many possible topologies that it is impossible to calculate the likelihood for every topology using existing computer hardware and software. That means it is necessary to use heuristics - to modify the tree you have until you can do no better. This is like hill climbing. You calculate the likelihood of a tree and then modify it. If the likelihood is higher, you keep it, if it is worse, you discard it.

This might sound simple, but it isn't. One challenge is that you can get trapped on a local maximum and mistake it for the best phylogeny, when in fact there are other phylogenies with very different topologies that are much better but not locally accessible. There is extraordinary craft that goes into building tools that are able to efficiently climb these likelihood surfaces without getting trapped in local maxima.

Optimization of calculations becomes very important. For example, it isn't necessary to recalculate all values on each new topology, since some of the calculations from previous topologies remain relevant [@Felsenstein:1981vk].

## Optimality criteria

Here we used likelihood as an optimality criterion to search over treespace, the set of all possible phylogenies, to find the phylogeny that maximizes the criterion. There are other optimality criteria that are used in phylogenetic inference. These include parsimony. In parsimony, the minimum number of changes along branches needed to explain the data at the tips is used as the criterion to evaluate each topology. Optimization proceeds by attempting to identify the topology that requires the fewest changes. This requires far less computational power than likelihood, so searches are faster.

Under some conditions parsimony and likelihood will recover similar topologies, but often they do not. This is because they are doing different things that under many conditions lead to different results [@steel2000parsimony]. For example, we do not always expect the simplest possible explanation for a given pattern to be the best explanation. If a character has a high rate of evolutionary change, then we expect many changes on a tree rather than the fewest possible. This is accommodated in a likelihood framework.

<!--chapter:end:inference.rmd-->

# Molecular inference in practice

In the last chapter we examined the mathematical and statistical underpinning of phylogenetic inference with maximum likelihood. In this chapter we examine some of the project design considerations and decisions you will need to make in implementing a phylogenetic analysis. We are sticking with DNA sequence data for now, but we will extend these approaches to other types of data later.

## Your question

The first step to an analysis is to clearly define your question. There will be many decisions to make along the way, and a clear question will provide an explicit benchmark for working through these decisions -- which decision is best for the question at hand? If you have a vague question it will be much harder to decide which steps are best, and many decisions about trade-offs will essentially be arbitrary.

## Taxon sampling

The tips in a phylogeny, be they genes, species, individuals, or some other evolving entity, are referred to as taxa. One of the first things you will want to consider is the breadth and depth of taxon sampling.

One of the most common mistakes in phylogenetic analyses is to include too few taxa. There are many ways that adding taxa helps:

- Adding taxa breaks up branches in the phylogeny. This often improves the performance of maximum likelihood. If you are only interested in taxa 1...20, it still helps to add in taxa 21...50, even if you end up not paying much attention to where they go. They will often improve your ability to infer relationships among the taxa you are most interested in.

- Adding taxa can help improve model evaluation and model parameter estimation.

- Adding taxa reduces the number of assumptions going into a study. You are almost always inferring a phylogeny because you are uncertain at the outset about evolutionary relationships. If, for example, you only include a couple of species from Clade B because you assume it is monophyletic, this poor sampling may be insufficient to reveal that Clade C is in fact nested within Clade B. With insufficient sampling of Clade B, it may instead appear that the two groups are sister clades.

- Adding taxa provides a more rigorous test of phylogenetic hypotheses. Say you are conducting a study to investigate the phylogenetic placement of a specific enigmatic species that is so morphologically distinct from other organisms that it is hard to know where it goes. You think it may fall in Clade A, Clade B, or Clade C, so you densely sample those groups. But in fact it falls within Clade D, and your taxon sampling is such that you can't even evaluate this hypothesis because you have no taxa from Clade D in your study.

- Adding more outgroup taxa often improves rooting. Skimping on outgroup sampling is one of the most common mistakes in project design. The best practice in general is to include the most closely related outgroup taxa possible, and some that are progressively more distantly related. The root and the branches that connect to it are the deepest in the tree, and can be the hardest to infer. So it is good to densely sample taxa relevant to the root.

There are costs to adding taxa that must be balanced against the benefits above:

- If you are collecting the data, it costs money to add taxa. That money may be best allocated in other ways.

- Adding taxa can considerably increase the computational demand of analyses. This can increase the time and cost of analysis, and maybe even make an analysis unfeasible on the computers available to the investigator.

There are some conditions under which you may want to exclude specific taxa, at least from some analyses:

- If you suspect that they data are contaminated, incorrectly identified, or insufficiently documented.

- Preliminary analyses suggest that the taxon has properties very different from other taxa in the study, such as a very different equilibrium frequency or an exceptionally high rate of evolution.

- The taxon has a very high fraction of missing data. Sometimes missing data makes a taxon unstable, which can obscure well supported relationships between other taxa. Sometimes missing data can interact with other factors to lead to bias in the placement of the taxon.

## Collecting sequence data

Once you have a general idea about taxon sampling, you will need to consider which genome regions to include in your analyses. To build a phylogeny, you need homologous characters across the taxa under investigation. In the context of DNA analyses, this means that you need overlapping genome regions across the taxa that will be in your phylogeny.  

Decisions about which specific taxa to include interact quite a bit with decisions about which genome regions you will consider, so there is often quite a bit of back and forth as you refine these decisions. At the coarsest level, if you are collecting data yourself you will often need to decide if you are going to capture a larger amount of data from fewer taxa or a smaller amount of data from many taxa. If you are using publicly available data, then your taxon and genome region sampling will be strongly constrained by what data are already available.

Decisions about what genome regions to include can be thought of as decisions about which genome enrichment strategy to use. These strategies restrict data acquisition (sequencing) to particular regions. Here I describe common enrichment strategies along a spectrum of increasing enrichment, from no enrichment (whole genome sequencing) to enrichment for a small number of specific genes. 

### Whole genomes

Phylogenies are now routinely inferred without enrichment of any genome regions -- the full genome is sequenced and analyzed. This is possible due to advances in DNA sequencing technologies, as well as improved methods for processing raw genome data into useful annotated genome sequences. Full genome phylogenetic analyses are still largely restricted to organisms with small genomes, in particular viruses. This has been a very powerful tool, for example, to investigate virus transmission through human populations. It is still expensive and difficult to build phylogenies with large genome sequences, though this is rapidly changing.

### Transcriptomes

A transcriptome is the collection of RNA in a cell or collection of cells. Because RNA is transcribed from the genome, sequencing the RNA gives a snapshot of an enriched subset of the genome. Whereas the other enrichment approaches described below are implemented by the investigator at the bench, transcriptome sequencing largely relies on a natural process in the living cell (transcription) to enrich for particular genome regions.

In a typical phylogenetic study based on transcriptome data, messenger RNA (mRNA), which encodes the protein coding genes, is isolated. mRNA is then copied to complimentary DNA (cDNA) and sequenced. Because many of the same genes are highly expressed across species and tissues, there is considerable overlap between the genes in transcriptome datasets from different samples. Many investigators are interested in protein coding genes for other purposes as well, so transcriptomes are a very cost-effective way to collect data from a broad diversity of species that can be used for multiple purposes.

There are a couple challenges to working with transcriptomes. For one, RNA is much less stable than DNA. It is therefore critical to take considerable care when collecting, storing, and processing tissue for transcriptome studies. 

### Targeted enrichment

In targeted enrichment, an investigator designs short bait sequences that are similar to conserved genome regions. They then isolate DNA from their taxa of interest, fragment it, and use the baits to fish out the conserved regions along with their neighboring sequences. This allows the investigator to created pools of DNA that are enriched for specific pre-selected regions. This is a highly cost effective way to isolate homologous sequences in across species, and works well when samples have fragmented DNA (in museum specimens, for example). 

The baits are typically designed based on one or more genomes that are already available in the clade of interest. There are a few challenges to using targeted enrichment. One is that data are difficult to combine across different studies that used different baits. In addition, the design and synthesis of baits poses a large up-front investments that makes this approach best suited to larger projects.

### RAD-seq

Like targeted enrichment, RAD-seq enriches for sequence data from specific regions scattered across the genome. It differs, though, in that it uses intrinsic properties of the genome for enrichment, rather than user-designed baits. Genomic DNA is digested with one or two restriction enzymes that cut the genome at specific small sequences, and leave the DNA with particular overhangs at the cut end. These cut fragments are then size-selected. If cutting with two restriction enzymes, the fragments that have different overhangs (because they were cut once with each enzyme) are then further enriched. The fragments are then sequenced.

The result is that sequences are enriched for the same regions that have a similar distance between the same restriction enzyme sites across taxa. This is a powerful way to get a consistent subset of the genome across many different samples. It doesn't require a big investment in baits at the outset, but there are a few important limitations. First, it only works well on taxa that are quite closely related, since differences in restriction site placement evolve relatively quickly and enrichment overlap falls quickly with evolutionary distance. Rad-seq therefore is most often used when looking at evolutionary relationships within species or among very closely related species. Second, there is very little control over which specific genome regions are sequenced. For example, if you want to build a phylogeny and look at the evolution of a particular gene, you can't readily engineer the sample enrichment to enrich for that specific gene.


### PCR

The most extreme form of genome enrichment is Polymerase Chain Reaction (PCR). This method enriches for a small number of specific genome regions selected by the user. Short DNA oligonucleotide sequences are designed to flank the region of interest and target it for amplification. By placing these oligonucleotides in conserved regions and engineering them to bind slightly different sequences, they can be used to successfully enrich the same genome region from quite distantly related species. PCR enabled the first wave of DNA sequence-based phylogenetic inference starting in the 1980s, and is still widely used used today even has a variety of new enrichment methods have become available.

PCR is cheap and relatively easy. Because it has been used for decades to sequence a small number of genes across a wide diversity of organisms, it is a great way to collect data that can be readily analyzed in combination with publicly available data. Ironically, though, it is now very expensive per-nucleotide to collect data with PCR relative to the other methods above. That's because it is difficult to leverage the advantages of modern high-throughput sequencing, which is very cheap per nucleotide, with such a small number of short amplified sequences. As one of the most extreme forms of genome enrichment available, it provides access to a very small fraction of the genome. PCR is still a convenient way to get a tiny amount of sequence data from a large number of taxa.

## Data processing upstream of phylogenetic analyses

The above section describes how different enrichment strategies work when collecting sequence data for phylogenetic analyses, but the differences are not limited to what happens at the bench. Each enrichment strategy requires its own series of data processing steps to get the data ready for phylogenetic inference. These steps vary greatly across enrichment approaches, requiring distinct methods and software tools. Exploring them in detail is beyond the scope of this text, but there are a few general aspects I will address.

The overall goal of the data processing that occurs upstream of the actual phylogenetic analysis has two primary objectives, estimating the sequence of the sampled genome regions and identification of homologous sequences across taxa.

### Estimation of original sequences

Raw sequence data have a few properties that make them unusable for direct analysis:

- They are redundant. The same genome regions are sequenced multiple times. PCR products are typically sequenced a couple times (once in each direction), and high throughput sequencing often sequences each region hundreds or thousands of times.

- They have many errors. These are introduced during sample preparation at the bench, by the sequencing instruments during data acquisition, and in the initial base calling that generates the sequence file. Errors in raw data vary across sequencing technology, and are on the order of a few per hundreds or thousands of nucleotides.

- They are fragmented. Many times the raw sequences do not span the full genome region of interest, and must be tiled together to predict longer regions.

- They are ambiguous. It often isn't clear what region of the genome a sequence belongs to, due to genomic repeats, heterozygosity, and genome duplication. This ambiguity must be resolved or eliminated, depending on the application.

The above technical challenges are usually addressed simultaneously in an analysis process called assembly. The goal of assembly is to predict the sequences of the original genome regions based on the raw sequence data. The general idea is to line up overlapping raw sequence data, correct errors by comparing sequences, and then to collapse all the sequences down to hypotheses about the original actual sequence from which all the raw data were generated. This is a very complex process, and still a major challenge for many genomes and transcriptomes in particular. The best approach differs quite a bit depending on the enrichment strategy, sequencing technology, and the properties of the genome (such as how repetative it is).

The process of assembling a genome (or genome regions) from scratch is referred to as *de novo* assembly. If high quality closely related genomes are available, they can be used for guided assembly or mapping, where the raw data are tiled onto the reference rather than assembled from scratch.

### Identification of homologous genome regions

It isn't enough to collect and assemble sequence data from the taxa or interest, we need to collect and identify *homologous* sequences that represent regions that are shared because they derive the the same region in common ancestors of the taxa.

Like assembly, the optimal approach for identifying homologous sequences depends greatly on the enrichment strategy used. This step is quite straight forward when targeted capture and PCR are used as enrichment strategies, because the data are from specific know regions that were often selected in part because their homology is easier to assess.

In some cases, such as the closely related virus genomes, genomes can be directly aligned with each other along their full lengths. In larger genomes, and transcriptomes, protein coding sequences are often extracted from the assemblies and are the focus of phylogenetic analyses. There are various approaches to identifying homologous protein coding genes across taxa. One is to identify sequences for a pre-selected panel of genes that are selected because they tend to be present in most datasets, they have properties of molecular evolution that are well-suited to phylogenetic analysis, and their homology is thought to be easier to assess. Another is to compare all gene sequences across all species to identify homologous regions. This can be a bit more computational work, but has the advantage of being able to optimize gene selection to the data and question at hand.

## Working with publicly available data

Most phylogenetic studies include at least some publicly available data from previously published studies. Some rely entirely on publicly available data, while others add new sequence data as well. The primary repositories for DNA sequence data in published studies, including phylogenetic studies, are [NCBI](https://www.ncbi.nlm.nih.gov/) and [EMBL-EBI](https://www.ebi.ac.uk/). Many of the same data are available in each. 

Most phylogenetic studies deposit their raw data in public archives like the [NCBI Sequence Read Archive](https://www.ncbi.nlm.nih.gov/sra), but these can require considerable processing (including assembly) before they can be used for phylogenetic inference. It can be hard to track down assemblies and other intermediate products that are easier to work with since they are not consistently deposited in centralized data archives. Wrangling publicly available data and getting it ready for analysis can be one of the most time consuming components of a phylogenetic inference project. This is one of the major challenges to conducting phylogenetic analyses of DNA sequence data at this time.

When I am interested in building a phylogeny for a particular group of organisms, one of my first steps is to take a look at the [NCBI taxonomy browser](https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi). There you can enter a taxonomic group name, and select which data you would like to see (Figure \@ref(fig:practice-cnidaria)). You can adjust the number of taxonomic levels to control whether you want to view just summaries for larger groups or get all the way down to the species level.

\begin{figure}
\includegraphics[width=5in]{figures/cnidaria_taxonomy_browser} \caption{A view of the sequence data available for Cnidaria. Here I have selected to view available Nucleotide, Protein, SRA, Genome, and Assembly data.}(\#fig:practice-cnidaria)
\end{figure}

Based on this overview, you can assess which types of data (*i.e.*, which data produced by which enrichment strategy) are best for advancing your question with publicly available data. All the PCR data and most of the raw sequence data will usually be available here, but many assemblies and processed data for whole genomes, transcriptomes, and other high-throughput datasets may not be. The best practice when working with these data is to take a deep dive into the recent literature and see if these intermediate products were deposited in another public archive, or contact authors for more details.


## Homologous sites

Once you have collected homologous sequences for one or more genome regions across your taxa of interest, you next need to identify homologous nucleotide sites within these regions. This process is referred to as multiple sequence alignment (MSA). Rather than rely on explicit models of molecular evolution, multiple sequence alignment usually relies on similarities between sequences. The general idea is to slide the sequences along each other and insert gaps as needed so that similarity at each site is optimized while reducing the number of gaps introduced. 

The output of multiple sequence alignment is a matrix. Each row is a taxon that will correspond to a tip in the phylogeny. Each column is a single nucleotide site that is hypothesized to be homologous across taxa. There are multiple file formats that are used to store aligned sequences, including fasta, nexus, and phylip.

## Combining information across multiple genome regions

Sometimes when we build phylogenies from genomic data, we are interested in the specific evolutionary history of the genome regions themselves. This is the case, or example, when looking at gene family evolution. Often, though, we are using the evolutionary history of the genomic regions as a proxy for the evolutionary history of the organisms, such as when we are asking questions with DNA data about how species are related to each other. There are a variety of conditions, though, under which different genome regions can have different evolutionary histories from eachother, and some of these histories deviate from the evolutionary history of the taxa as a whole [@maddison1997gene]. Processes that can lead different regions to have different evolutionary histories include:

- Horizontal transfer of genome regions across species. This can occur, for example, when a virus caries DNA from one species to another. Rates of horizontal gene transfer vary greatly across different groups of organisms.

- Duplication and loss of genome regions. Genome replication is not always perfect, and sometimes results in an organism inheriting multiple copies of a whole genome or specific genome regions from a parent. In fact, many genes are members of gene families within a species that arose via a history of duplication and subsequent differentiation. As genome regions are duplicated and sometimes lost, their evolutionary history can become distinct from that of other genome regions.

- All variation that we see across species originally arises within populations. Sometimes new variants are lost, and sometimes they become fixed across entire species. If multiple variants persist through multiple speciation events, though, the evolutionary history of some genome regions can differ from that of species. This process is called Incomplete Lineage Sorting (ILS). Rates of ILS are higher on shorter branches and when populations are larger.

If there are concerns about incongruent evolutionary histories in the group of taxa under investigation, there are a variety of methods available for addressing each of these sources of incongruence. In general they involve independently estimating the phylogeny of each region, and then integrating information across these independent phylogenies.

In cases where such differences are expected to be rare or have little impact, it is common practice to concatenate alignments. Each homologous gene region is aligned independently, and then the alignments are joined end to end into a giant super-alignment. In this case, information is integrated across regions prior to phylogenetic inference.


<!--chapter:end:inference_in_practice.rmd-->

# Evaluation

## Model evaluation

I have introduced the use of models of DNA evolution for simulation and inference, but I haven't explained how to select a model. Given a dataset, consisting of aligned DNA sequences for a set of taxa that correspond to tips on a phylogeny, how do you decide which model to use?

### Model structure

Each model parameters can be treated in one of at least three ways [@Hohna2014]:

- Constant. The parameter is clamped to a specific value before the analysis and is not free to vary.

- Stochastic. The parameter is free to vary in the analysis. This allows the value to be estimated from the data as part of the inference process.

- Deterministic. The parameter value depends on the values of other parameters according to specified mathematical relationships. Their values can vary, but are determined by the value of other parameters and cannot be set independently from them.


The most widely used DNA sequence evolution models include the General Time Reversible model and its derivatives (Section \@ref(expanding-the-models)). The GTR model has 11 parameters (Figure \@ref(fig:evaluation-models-nested)). These include the global rate $\mu$ used to tune the overall rate of evolution. Next come the relative rate parameters $a,b,c,d,e,f$ that modify the rates of change between particular nucleotide states, so that they can differ from each other. For example, if `a=0.5` and `b=2`, then the rate of changes between C and A occur at a rate four times higher than changes between A and G. Finally we have the equilibrium frequencies $\pi_A,\pi_C,\pi_G,\pi_T$.

These parameters are treated as follows in the GTR model (Figure \@ref(fig:evaluation-models-nested)):

- $\mu$ is constant. With $\mu=1$, the branch lengths are in units of expected evolutionary change.

- The six rate parameters are constrained such that $a+b+c+d+e+f=6$. If they were all free to vary, then values that have a sum other than 6 would lead to changes in the global rate rather than the relative rates. Imagine setting them all to $10$, for example. This would be equivalent to setting them all to 1 and setting $\mu=10$. This mathematical relationship between the relative rate parameters means that only five of them can vary independently, because the sixth will depend on the other five and the fact that they all sum to 6. This means that five of the rate parameters are stochastic, and one is deterministic. For our purposes it doesn't matter which one is deterministic, only that one of them is, so I'll treat $f$ as the deterministic rate parameter.

- The four equilibrium frequencies are constrained such that $\pi_A+\pi_C+\pi_G+\pi_T=1$. This is because they are exclusive frequencies, and there are no other possible states. Given that every site must be an A, C, G, or T, their frequencies must sum to $1$. This mathematical relationship between the equilibrium frequency parameters means that only three of them can vary independently -- three are stochastic and one is deterministic. Again, it doesn't matter which one is deterministic, only how many are stochastic, so I'll treat $\pi_A$ as the deterministic parameter.

\begin{figure}
\includegraphics[width=8.42in]{figures/models_dna} \caption{A hierarchical view of DNA substitution models. The number of degrees of freedom is determined by the number of independent stochastic parameters (boxes with rounded corners). All other parameters are either constant (set to a specific value ahead of the analysis; boxes with straight lines) or deterministic (their value depends on the value of other parameters according to specified relationships; boxes with dashed lines). Here $\mu=1$, such that the branch lengths in the phylogeny are the expected amount of evolutionary change. The models are listed from top to bottom by increasing nestedness. Rates are ordered so that transitions and transversions are adjacent. Any model could be realized as a subset of the possible parameter space of the models above it. The visual nomenclature is inspired by Hohna et al. (2014).}(\#fig:evaluation-models-nested)
\end{figure}

The number of stochastic parameters in a model is referred to as the degrees of freedom, $df$. You can think of it is the number of knobs that can be turned freely during the analysis. Models that have higher degrees of freedom are often referred to as more complex than models with fewer degrees of freedom.

The GTR model has $df=8$. There are $5$ stochastic relative rate parameters and $3$ stochastic equilibrium frequencies (Figure \@ref(fig:evaluation-models-nested)). The other models we have seen are nested within this. By nested I mean that they can take on a smaller subset of the parameter values than the more complex model can. Models that are nested within other models have a smaller degree of freedom. See the [iqtree DNA model documentation](http://www.iqtree.org/doc/Substitution-Models#dna-models) for a longer list of models.

The HKY85 model has $df=4$ (Figure \@ref(fig:evaluation-models-nested)). There is $1$ stochastic relative rate parameter, which determines the transition to transversion ratio. There are the same $3$ stochastic equilibrium frequency parameters as in the GTR model. There are many values that a GTR model can take that an HKY85 model cannot, for example $b$ can differ from $e$ in GTR but not in HKY85. Every value that HKY85 can take can also be taken by GTR. For example, in HKY85 $b=e$, and in GTR $b$ and $e$ are independent stochastic variables that can be different or that can take on the same value. Because every possible value of HKY85 is also possible in GTR, and GTR has more degrees of freedom than GTR, HKY85 is nested within GTR.

Likewise, F81 is nested within HKY85 (and therefore GTR as well). It has $df=3$, the same $3$ stochastic equilibrium frequency parameters as in the GTR and HKY85 models. All the relative rates are constant and set to $1$. Any value that F81 can take can also be taken by HKY85 or GTR.

The first model we introduced, JC, has $df=0$. All the relative rates are constant at $1$, and all the equilibrium frequencies are constant at $1$. In typical use, $\mu=1$. All the other models mentioned above have stochastic parameters that can take on these values, so JC is nested within them all.

Though nested models always have different degrees of freedom, there is no guarantee that models with different degrees of freedom have a nested relationship. It could be that the simpler model has some stochastic parameters that are not stochastic in the more complex model, even though the more complex model has a greater number of free parameters overall. That would allow the simpler model to take on values that the more complex model cannot, violating the nested relationship. When evaluating nestedness it is therefore critical to consider model structure, not just the degrees of freedom.

### Evaluating models

In our previous examinations of inference, we used likelihood as an optimality criterion when looking for the phylogeny that best explains our data. Similarly, we can search for the model that best explains the data. We can pick a reasonable phylogeny and evaluate the likelihood of the data under each of the models we would like to consider. In each case we also optimize the model parameter values for each model to make sure we are comparing the models in the best possible light.

We can then make a series of pairwise comparisons between models, where we consider the ratio of their likelihoods. This is the gist of what is called a likelihood ratio test (LRT). Instead of considering the ratio of likelihoods, we can consider  the difference of their log likelihoods since:

\begin{equation} 
  ln(\frac{a}{b}) = ln(a) - ln(b)
  (\#eq:logs-diff)
\end{equation}

If this difference, which we can call $\Delta$, in log likelihoods is positive, then the model corresponding to $a$ is more likely. If it is negative, then the model corresponding to $b$ is more likely.

Let's say we are comparing GTR to HKY85, and we denote the likelihood under GTR as $L_{GTR}$ and the likelihood under HKY85 as $L_{HKY85}$. We'll put the model with more parameters, GTR in this case, in the numerator, *i.e.* set $a$ above to $L_{GTR}$ and $b$ to $L_{HKY85}$. 

\begin{equation} 
  \Delta = ln(\frac{L_{GTR}}{L_{HKY85}}) = ln(L_{GTR}) - ln(L_{HKY85})
  (\#eq:logs-gtr-hyk)
\end{equation}

One way to proceed would then be to select GTR if $\Delta>0$, and HKY85 if $\Delta<0$. This wouldn't be a good way to go, though, since it would pick GTR every single time. The reason is that HKY85 is nested within GTR. That means that the best possible likelihood under HKY85 is also available under GTR. Because it has more degrees of freedom, GTR has many other possible values, and chances are very good that one of those will be more likely than the parameter values that were most likely under HKY85. If comparing two nested models, the model with more degrees of freedom will never have a likelihood lower than the simpler model.

This would seem to imply that more complex models are always better, but they most certainly are not. As we add degrees of freedom, we are adding stochastic parameters that must be estimated from the data. In a very extreme case, we clearly couldn't estimate an infinite number of parameters from a finite dataset -- there wouldn't be enough information to independently assess each parameter. But there are challenges even with a relatively small number of parameters. If we add too many model parameters, we can over-fit. Essentially, if there are too many model parameters we can make any phylogeny look good by adjusting the model parameters. This makes it more difficult to optimize the topology and branch lengths based on their impact on the likelihood. The data have finite information, and the more information we use to estimate model parameters the less we have to estimate the phylogeny.

When comparing nested models, the question therefore isn't whether one model has higher likelihood than the other, but whether the increase in likelihood one gets from adding parameters is worth the cost of adding the parameters. There are a few different ways to make this cost/benefit analysis.

The simplest is to slightly modify the way we compare the log likelihoods, so that their difference is distributed according to a $\chi^2$ distribution with degrees of freedom equal to the difference in degrees of freedom of the models:

\begin{equation} 
  \delta = 2(ln(L_{1}) - ln(L_{0}))
  (\#eq:lrt)
\end{equation}

We can compare this test statistic $\delta$ to the appropriate $\chi^2$ distribution to assess if the more complex model has a significantly greater likelihood. If not, we stick with the simpler model. It is important to note that it is only appropriate for comparing *nested* models.

There are a few challenges to applying the LRT to model selection in phylogenetics [@posada2004model]. One issue is that the test presumes that one of the models is correct [@zhang1999performance], but in phylogenetics models are always simplifications of the evolutionary process at hand. The impact of violating this assumption varies across data sets and analyses, but can lead do undesirable behavior in real-world applications.

There are two other approaches commonly used in phylogenetic model selection. Where $L_i$ is the likelihood under model $i$, $k_i$ is the degrees of freedom for the model, and $n$ is sample size (*e.g.* number of sites in the alignment), these are the Akaike Information Criterion (AIC):

\begin{equation} 
  AIC_i = 2k_i - 2ln(L_i)
  (\#eq:aic)
\end{equation}

And the Bayesian Information Criterion (BIC):

\begin{equation} 
  BIC_i = k_iln(n) - 2ln(L_i)
  (\#eq:bic)
\end{equation}

To apply either of these criteria, they are calculated for each model and the model with the *lowest* value is selected. Adding parameters increases the value, penalizing any increase in likelihood they provide. These criteria have multiple advantages over LRT, including that they can be used to compare non-nested models [@Burnham2002].

To decide whether to use LRT, AIC, or BIC model selection criteria, you need to run a model selection criterion selection analysis. Just kidding. To decide which to use, you should apply your knowledge of phylogenetic methods critically. In many cases, these different approaches will lead to very similar decisions about model selection. As an example of a fairly typical approach, the program iqtree runs AIC and BIC analyses, but proceeds under the model selected by BIC unless you explicitly step in to apply a different model. If, on inspection of the analysis results, you find that AIC selects a very different model, it would be prudent to run your analyses under that model as well to see if it leads to differences that are relevant to the questions that motivate your project.

### Adding complexity to DNA evolution models

The GTR model, and its nested derivatives, capture only a small subset of evolutionary processes and therefore can't describe many of patterns in observed data. One of the most obvious patterns you will notice when inspecting multiple sequence alignments is that the amount of variation is very different across sites. Some columns will be highly variable, while others are nearly constant. This pattern is due to extensive heterogeneity across sites in rate of evolution. 

Two additional model features are often added to address this rate heterogeneity - `I` and `G`. The I parameter is the fraction of sites that are invariant and effectively have a rate of zero. `G` accommodates rate heterogeneity across sites that do vary [@yang1994maximum]. This is modeled with a continuous $\Gamma$ distribution that is divided into discrete rate categories, usually 4, to speed up computations. Sites are assigned to these different rate categories. To specify the shape of the $\Gamma$ distribution, and therefore the rates of the categories, a parameter referred to as $\alpha$ is used.

`I` and `G` can be added to GTR and its derivative models. Model selection routines usually examine a panel of models without these rate heterogeneity features, then with `I`, `G`, and `I+G`.  The models with `I+G` are often selected, reflecting the importance of accommodating rate heterogeneity in real data.

## Topological evaluation

Maximum likelihood inference gives a point estimate of the phylogeny -- a single phylogeny (topology and branch lengths) that maximizes the probability of the observed data under the model. A maximum likelihood analysis will always return a single phylogeny, regardless of how strong the support for that phylogeny is or how much higher its likelihood is than that of other phylogenies. Presenting a phylogeny without any indication of topological support is akin to presenting an estimate of mass made from multiple observations without showing error bars. It is difficult to interpret the point estimate without having a sense of how much uncertainty there is. 

### Summarizing topological support

Before we get into how to assess support for a phylogenetic hypothesis, it use helpful to think about what that support means and how it is viewed on a phylogeny. Given a specific topology, such as a maximum likelihood phylogeny, how can we summarize and present support for that topology? I'll refer to the topology we are evaluating as the *focal topology*.

Most methods that evaluate topologies generate a large set of phylogenies, which I'll call the *sample*. Assessing support for a feature of the focal topology is a matter of assessing the frequency of phylogenies in the sample that also have that feature. We could assess the support for the focal tree as a whole by asking how frequent identical topologies are in the sample. But support can often be strong in one part of a phylogeny and weak in another. Reporting equivalence of the entire topology provides no window into that variation. This approach would also break down as taxa are added, which quickly increases them number of possible topologies and reduces the chances of any two analyses returning the exact same topologies, given the variation that is inherent in heuristic searches.

Branch frequencies are far more useful. It is helpful to think of a branch as a split (also sometimes called a bipartition) that separates all the taxa in a phylogeny into two groups - those on one side of the branch, and those on the other (Figure \@ref(fig:eval-splits)). We will consider two branches to be equivalent if they lead to the same taxon split. This allows us to discuss the equivalence of branches deep in a phylogeny, even when there are many other topological variations elsewhere in the phylogeny.



\begin{figure}
\includegraphics[width=3.92in]{figures/splits} \caption{Four phylogenies in a sample, one focal phylogeny, and a table of splits found in all of these topologies. A split is a branch, with the identification of the branch based on which taxa are split from each other by the branch. The splits table shows the binary encoding of each split, where taxa on the same side of the split have the same binary number (0 or 1). The assignment of 1 or 0 to a particular side of the split is arbitrary. Identical splits are labeled consistently above the branches throughout the figure. The frequency of the split is based on the proportion of sample phylogenies that contain the splits. The frequencies of the sample splits are shown as percentages on the branches in the focal topology.}(\#fig:eval-splits)
\end{figure}




We can consider each branch in the focal phylogeny independently. For a given focal branch, we count the fraction of phylogenies in the sample that have the same branch, as determined by producing an identical split in taxa. We consider this frequency as the support for the focal branch. If the frequency is 1, the branch was in all the phylogenies in the sample. If it is zero, it wasn't present in any of the phylogenies in the sample. The interpretation of these frequencies, which are often reported as percents, depends on the method that was used to generate the sample.

It should be noted that these support values are often referred to as "nodal support values", and are often drawn onto nodes. This is unfortunate, as they are branch support values. They are just commonly associated with child node of the branch rather than the branch itself. This obscures their meaning, and leads to serious problems when trees are re-rooted [@10.1093/molbev/msx055].


### Bootstrapping

The most widely used approach to assessing confidence in maximum likelihood phylogenetic inference is the bootstrap [@felsenstein1985confidence]. Given a data matrix where rows are taxa and columns are characters (nucleotide sites in the case of DNA) with $n$ columns, bootstrapping generates a new matrix, also with $n$ columns, by resampling from the the original matrix with replacement. Some columns from the original matrix won't be sampled at all, some will be sampled once, and some will be sampled multiple times.

Bootstrapping is used to generate many new matrices (typically at least a hundred, but ideally 1000 or more), and maximum likelihood searches are then run on each matrix. This generates a sample of phylogenies. These can be examined in a variety of ways, but the most common is to evaluate the frequency of each branch of the maximum likelihood tree (generated form the original data matrix) in the sample of bootstrap phylogenies. A branch frequency of 100% indicates that a branch is always in the bootstrap replicates and is taken to be strong support. Support below 90% is generally considered weak.






Note that I am not using the term "significance" when referring to bootstrap support. This is because bootstraps don't have a clear statistical interpretation. It is a scale that varies from $0$ to $1$, but is not itself a significance. It just indicates how frequently a branch is recovered when the data columns are resampled. This gives a sense of how broad support is for the branch across characters, but is quite complicated in reality. For example, some variation across bootstrap replicates is due to resampling, but sometimes it is just due to the stochastic nature of heuristic maximum likelihood searches.

Many phylogenetic inference programs do not run full independent maximum likelihood searches on each bootstrap replicate. Instead, they borrow information across replicates, such as optimal starting trees, to speed up the process.


## Topology tests

Rather than assess the support of a particular focal topology, sometimes you want to assess how significant the difference in support is for specific phylogenies. There are several different topology tests that address these questions. They include the SOWH test [@swofford1996molecular], among others.



<!--chapter:end:evaluation.rmd-->

# Bayesian phylogenetics

Let's take stock of what we have covered so far. We introduced models, and how to simulate data with them. We then explored how to use models to calculate the likelihood -- the probability of the observed data given the topology, branch lengths, model parameters, and model. We used likelihood as an optimality criterion in heuristic searches to find the Maximum Likelihood (ML) phylogeny. We introduced the methods to calculate the frequency of branches on a focal topology, like the ML topology, in a sample of phylogenies. We showed how to generate a sample of phylogenies by running ML searches on bootstrapped matrices, and used this to calculate bootstrap support for each branch in the ML phylogeny.

ML and bootstraps are widely used and are a critical foundation for many phylogenetic analyses. There are, however, a few things about analysis frameworks  based on optimality criteria, ML, and bootstraps that are not ideal:

- Whenever we apply an optimality criterion, such as ML or parsimony, to identify the "best" phylogeny, that doesn't tell us anything about how much better this optimal phylogeny is than other hypotheses. If it is the best phylogeny by far, then this single phylogeny tells us a lot about the the phylogenetic information in our topology. If however, there are multiple phylogenies that are almost as good as the best one, as is often the case, then we would need to know about these others as well to have a good understanding of what hypotheses are consistent with our data.

- Likelihood is the probability of the data given the phylogenetic hypothesis. The probability of the data under the ML hypothesis will be exceptionally low, often far less than one in a million, since the ML hypothesis could generate many other data as well. This is because we are evaluating the probability of the data given the hypothesis, but often what we really want to know is the probability of the hypothesis given the data. The two are quite different, but are related. It would be nice to be more explicit about that relationship.

- Bootstraps are a convenient way to generate a sample of phylogenies, but their statistical interpretation is not clear. The frequencies of bootstrap supports don't correspond in a clear way to probabilities of our hypothesis, but instead tell us something about how frequently features of the phylogeny are supported when we resample the data. In practice it turns out this is a good proxy for phylogenetic support, but it would be nice to have support values that have a more explicit statistical interpretation.

All analyses include a variety of tradeoffs, and the downsides of the issues listed above are often mitigated by the multiple upsides of a ML bootstrap analysis framework. It also greatly helps that there are decades of experience with such analyses that help contextualize and interpret ML bootstrap results. This work has also produced ML methods and software packages that are highly optimized for computational efficiency, enabling the routine application of these approaches to very large datasets.

Another analysis framework, Bayesian statistics, directly addresses all of the issues listed above [@holder2003, @huelsenbeck2001mrbayes, @larget1999markov]. Rather than focus on a single "best" topology, it provides a set of hypotheses consistent with the data. The frequencies of these hypotheses in the sample are the expected probabilities of the hypotheses given the data. These frequencies have a clear probabilistic interpretation, unlike the bootstrap support values. Bayesian statistics and likelihood have deep mathematical connections, so we will be able to build directly on the foundation established in previous chapters. 

## Bayesian statistics

Bayesian statistics is much older than many other domains of statistics, but have recently seen a surge in use as computational and methodological advances allow them to be applied more effectively to a wider number of problems. The basic intuition is that our understanding of the world are not drawn from the data alone. Instead, the data are used to update our prior understanding of the world. This updated understanding is referred to as the posterior. There are many excellent introductions to Bayesian statistics, so I will not provide a full derivation here. If you would like more of a background, please consult Appendix \@ref(stats-bayes).

Bayes' theorem establishes the the following relationships:

\begin{equation} 
  P(H|D) = \frac{P(D|H)P(H)}{P(D)} 
  (\#eq:bayes-theorem)
\end{equation}

$P(H|D)$, read as "the probability of the hypothesis given the data", is the posterior probability of a given hypothesis. It takes into account prior expectations and new insight from the data. This posterior probability is what we are trying to estimate. We have already seen $P(D|H)$, read as "the probability of the data given the hypothesis". This is the likelihood, and from previous chapters we know how to calculate it. $P(H)$ and $P(D)$ are our prior probabilities, our world view before we collected data. $P(H)$ is the prior probability of the hypothesis, without considering the data. $P(D)$ is the prior probability of the data, without considering the hypothesis.

Let's plug in a few numbers to get some intuition for the behavior of Bayes' theorem. First, consider the case where $P(H)=0$, *i.e.* you assign a prior probability of $0$ to the hypothesis. The posterior probability, $P(H|D)$, will then also be $0$. This shows that if you believe ahead of collecting data that the hypothesis is absolutely impossible, no amount of data can change your mind and your updated hypothesis, the posterior, will also be $0$. 

Second, let's consider the case where the data are just as likely under the hypothesis as they are in general. This would be like having a medical test for a specific condition where the test was so bad that the data (test result) didn't depend in any way on the hypothesis (the presence of the condition). For example, the test returns a positive 10% of the time regardless of whether you have the condition or not. In that situation, $P(D|H)=P(D)$. Since $P(D|H)$ is in the numerator and $P(D)$ is in the denominator, they cancel out. That leaves $P(H|D)=P(H)$ -- the posterior probability of the hypothesis is the same as the prior on the hypothesis. The data didn't change our understanding of the hypothesis at all. This is the behavior we want when the data have no information relevant to the hypothesis.

Third, consider a case where the data are perfect indicators of the hypothesis. You get a specific pattern in the data whenever, and only when, the hypothesis is true. Because the hypothesis and data are perfectly linked, $P(D)=P(H)$ the priors cancel out. In this case, $P(H|D)=P(D|H)$, *i.e.* the posterior becomes equal to the likelihood. This never happens in phylogenetic inference, since any given phylogeny could always generate multiple sequences at the tips. But it is the case that as the data become more informative the priors have less impact on the posterior.

## Bayesian phylogenetic inference

To calculate the posterior probability of a phylogenetic hypothesis, we need to address all the terms on the right side of Equation \@ref(eq:bayes-theorem). We already know how to calculate $P(D|H)$, the likelihood. What about $P(H)$ and $P(D)$? There are a variety of practical approaches to $P(H)$ that have been shown to work well in the context of phylogenetics. These include uniform priors, where all topologies are considered to be equally likely. The priors on branch length can be approximated from an exponential distribution. One of the major take-aways from the past two decades of work on Bayesian phylogenetics is that inference is quite robust to $P(H)$ when the data are informative about the phylogeny, as expected.

What then, about $P(D)$? This is our prior on the data itself. Calculating it requires integrating the probability of generating these particular character data (*e.g.*, nucleotide sequences observed at the tips) across all possible topologies and branch lengths. That would be prohibitively computationally expensive to actually do. So we won't.

Instead, we will forego calculating $P(D)$ at all by approximating the posterior with Markov Chain Monte Carlo (MCMC) sampling [@metropolis1953]. MCMC is a widely used to approximate complex probability distributions that are too complex to calculate analytically. MCMC is implemented by proposing a series of hypothesis that are either rejected or accepted based on specially formulated test statistic $R$ and criteria for evaluating this statistic, such that the accepted hypotheses form a sample that is drawn from the distribution of interest. In our case, that distribution of interest is the posterior distribution.

Consider the current hypothesis to be $H$, and the newly proposed hypothesis $H^*$. We calculate our test statistic as the ratio of the posterior probability of $H^*$ to the prior probability of $H$:

\begin{equation} 
  R = \frac{P(D|H^*)P(H^*)}{P(D)} \frac{P(D)}{P(D|H)P(H)} = \frac{P(D|H^*)P(H^*)}{P(D|H)P(H)}
  (\#eq:bayes-mcmc)
\end{equation}


Because $P(D)$ doesn't depend on the hypothesis under consideration, it is the same in both posteriors. Because we are considering a ratio of posteriors, it cancels out. We don't need to calculate it to derive $R$.

The "Markov Chain" in MCMC alludes to the fact that MCMC is a series of repeated events that depends only on the previous step. Each repeated cycle of events, also known as a generation, proceeds as follows:

1. We have hypothesis $H$.
2. We propose a new hypothesis $H^*$ by modifying $H$.
3. We calculate $R$ according to Equation \@ref(eq:bayes-mcmc).
4. If $R>1$, we accept $H^*$. If If $R<1$, we accept $H^*$ with probability $R$. Otherwise, we retain $H$.
5. The result of the step above is added to the posterior sample, and becomes $H$ for the next iteration of the cycle.

MCMC produces a sample of model parameters and topologies with branch lengths. This sample is an approximation of the posterior distribution of these entities. We can summarize the topologies in this posterior sample in the same way we did for bootstraps, as branch frequencies. Unlike bootstraps, though, the frequency of a branch in this distribution has a clear statistical interpretation. It is an approximation of the posterior probability of that branch, *i.e.* the probability of the branch given the data. The branch lengths and model parameters form continuous probability distributions. We can summarize these in a variety of ways, for example by taking the mean for each.

There are a variety of practical considerations to implementing a Bayesian phylogenetic analysis with MCMC. These include:

- Selecting the appropriate model. Many of the same considerations we reviewed in the context of likelihood apply here. 
- Selecting appropriate priors on topology, branch length, and model parameters.
- Devising an appropriate hypothesis proposal mechanism. If the new hypothesis $H^*$ is too different from $H$, it will tend to be rejected as $H$ becomes optimized. This will lead to an approximated posterior distribution that is too narrow, leading to overconfidence in a small set of hypotheses. If the steps are too small, then MCMC will tend to get trapped in local optima because they cannot find more distant better optima. There are several approaches to these challenges, including searches with multiple MCMC chains that take different step sizes.
- The very early samples in the chain are not a good estimate of the posterior distribution, because the initial $H$ is 
not necessarily close to a peak in the posterior. The initial samples before MCMC settles into a stable distribution are therefore discarded as part of a "burn-in" phase.
- Knowing when enough generations have been sampled to adequately approximate the posterior distribution. This is often evaluated by running multiple independent MCMC analyses and stopping them if and when they have converged on similar distributions.


## Resources

- A video introduction to Bayes Theorem: https://www.youtube.com/watch?v=HZGCoVF3YvM
- The excellent MCMC robots by Paul Lewis: https://plewis.github.io/applets/mcmc-robot/

<!--chapter:end:bayes.rmd-->

# Additional character types

Character types are fundamental to phylogenetics. Specifying the character types is a critical aspect of how we articulate our ontological perspective (*i.e.*, what organismal attributes exist, which are worth considering for the question at hand, and what the relation between them is). The identification of which character type your data correspond to is a decision about measurement theory [@houle2011measurement] -- a field that sits at the intersection of math, statistics, and philosophy that concerns the relationships between measurements and the reality they represent, clarifies what information the measurements contain, examines which mathematical operations we can perform with them, and reveals what actual transforms those operations correspond to. With a name like "measurement theory", you might assume that it is a dusty and boring annoyance that someone else needs to worry about, but it is actually an exciting and grounding framework for understanding many of the central aspects of what we do in science.


\begin{figure}
\includegraphics[width=4.42in]{figures/scale-type} \caption{Scale types from measurement theory that are relevant to biology. Permissible transformations indicate the mathematical operations that can be performed on measurements of each scale type without distorting their meaning. The Domain indicates the state space, *i.e.* range of possible values. Meaningful comparisons indicates comparisons that can be made between measurements of each scale type. Reproduced from Table 1 of Houle et al. (2011).}(\#fig:characters-scaletype)
\end{figure}

Since the practice of measurement in evolutionary biology proceeded pragmatically and largely independent of measurement theory at large, there are some differences in the nomenclature. What phylogenetic biologists call "character type" is referred to in measurement theory, and many other fields of science, as "scale type". 

To date we have considered only one specific biological measurement - DNA nucleotide sequence data. Measurements of DNA sequences have the following attributes:

- A DNA character is discrete and unordered. It is discrete because it has a finite number of specific states that it can take on. It is unordered because changes don't have to occur in a specific order, any state can change to any other state directly. In measurement theory terms, discrete unordered character types corresponds to a nominal scale type.
- There are 4 possible states, corresponding to each of the 4 nucleotides -- `A`, `C`, `G`, and `T`. This defines the state space of the character, it can take on these particular values and no others.

There are many other types of organism measurements, and therefore state spaces and character types, that are addressed in a phylogenetic context. Here we consider some of the more frequently applied character types. Changing the state space for discrete characters changes the dimensions of the model matrices we have used. Changing scale types requires entirely new model types, since different mathematical operations are permissible and sensical for different scale types.

## Nominal scale types

There are several other frequent applications of nominal scale types beyond DNA sequences in phylogenetic analyses. The most common include others include other molecular sequence data, but they are also used for discrete unordered morphological character states

### Amino acids

Protein sequences are handled very similarly to DNA sequences, the character states just correspond to amino acids rather than to DNA nucleotides. They are discrete and unordered, and therefore on a nominal scale type. There are 20 possible states instead of 4, so the primary difference is that the state space is larger. This means there are many more model parameters than for DNA data.

There are a few reasons why protein sequences are often considered rather than the DNA sequences that encode them. One is that questions about protein evolution are best addressed with models that directly describe protein evolution. Another reason is that synonymous changes in protein coding DNA sequences quickly saturate for more distant evolutionary comparisons. This makes it difficult to align sequences, and means that much of the variation in DNA sequence has little information about phylogenetic relationships. Protein data can be more tractable to work with in this situation.

### Codons

Since there are 4 possible DNA nucleotides and codons are 3 nucleotides long, there are $4^3=64$ possible codons. Each one of these codons corresponds to a specific amino acid or stop codon. In some cases, it is most interesting to consider each of the 64 codons as a discrete character state. The models then have matrices that have dimensions of 64 (as opposed to 4 for nucleotides and 20 for amino acids).

### Morphology

Direct analogs of the DNA sequence evolution models we have explored in previous chapters are often applied to discrete unordered morphological traits, such as the presence or absence of limbs [@harmon2018phylogenetic, chapter 7].

## Ordinal scale types

Ordinal scale types include measurements such as the number of digits on a forelimb. They differ from nominal scale types in that there is a ranking, *i.e.* some values are larger than others [@houle2011measurement, Table 1]. Character measurements on an ordinal scale type are often referred to in phylogenetics as discrete ordered character types. Models for the evolution of ordinal data typically disallow instantaneous changes that skip intermediate values. For example, to evolve from a forelimb with 5 digits to one with 3 digits, the model requires that the character pass through an intermediate state of 4 digits.

## Continuous data

Many characters, such as body mass, limb length, protein abundance, maximum swimming speed, and metabolic rate can take on a value within some range of real numbers. These character states are often lumped together by phylogenetic biologists under the single umbrella of continuous character data, since they can take on any one of an infinite number of values in a continuous range. Measurement theory, on the other hand, identifies multiple scale types that all have continuous values, but that have very different state spaces (*i.e.*, ranges of values), interpretations, and sensible mathematical interpretations. Many of the critical methodological challenges in phylogenetic biology right now will require distinguishing between the different continuous scale types and developing appropriate models for each.

The evolution of continuous measurements, regardless of specific scale type, are often modeled with the Brownian Motion (BM) family of models. At any point in time, the value can take an incremental step up or down. There are two parameters - the starting value, and the step size per unit time.

The use of BM models for phylogenetic analysis of continuous data is a pragmatic choice, as it greatly simplifies many calculations but there are many ways in which BM doesn't actually describe the evolution of continuous traits. For example, BM can result in a value that is any real number, positive or negative, whereas many biological measurements that are considered in a phylogenetic perspective can only take on positive values. Sometimes these discrepancies have little impact, and sometimes they can lead to entirely wrong conclusions.

### Ratio scale type

The most commonly encountered continuous scale type in phylogenetic analyses is the ratio scale type [@houle2011measurement, Table 1]. These measurements can take on values that are positive real numbers. They include many common continuous measurements, such as mass, length, and time interval. The name "ratio scale type" refers to the fact that ratios of these measurements are invariant with respect to units. If the ratio of body lengths of frog A to frog B is 2.38 when measured in centimeters, it will also be 2.38 when measured in inches, miles, or any other unit of length.

### Difference scale type

Ratio scale type data are often log transformed before phylogenetic analysis. This places them on a different scale type - the difference scale type. It is so named because differences are invariant with respect to units. 



<!--chapter:end:character_types.rmd-->

# Phylogenies and time

Phylogenies consider the history, pattern, and process of evolution through time, so time is a critical feature of phylogenetic analyses. The specific considerations of time vary across analyses and studies, depending on the data available and the questions asked.

It is helpful to first think about how the elements of a phylogeny correspond to time. We will consider rooted trees, where the direction of time is specified and runs from the root to the tips. Each node occurs at a specific point in time, even if the specific timing is unknown. We will call this point in time the node age. There is often confusion about the description of relative time on phylogenies. I will describe the magnitude of age here as time before the present. A node minimum age is closer to the present (further forward in time) and a node with maximum age as further from the present (further back in time). A node is treated as a singular divergence event, and has no duration. This of course is an approximation of the actual biology of divergence, which can take place over a period of time as populations become increasingly isolated but gene flow may persist between them.

Each branch connects two nodes. In a rooted tree, we refer to the node closer to the root (or that is the root) as the parent node, and the node closer to the tips (or that is a tip) as the child node. The starting and ending times of the branch are set by the ages of the parent and child nodes. The duration of the branch is the difference in the ages of these nodes.


## Measurements of time on trees

As discussed in Section \@ref(trees-branch-lengths), branch length can mean different things. It is up to the investigator to specify an branch length, and clearly communicate what it means. The three usual approaches are a cladogram (branch lengths are not specified and have no meaning), phylogram (branch lengths are the expected amount of evolutionary change in the traits used to infer the phylogeny), and chronogram, where branch lengths are in units of time.

### Cladograms

Because branch lengths in a cladogram have no meaning, we cannot make absolute statements about time in a cladogram. This doesn't mean, though, that we can't say anything about time -- we can still make some ordinal statements about the relative ages of nodes.

![(\#fig:time-cladogram)A cladogram. Nodes and node numbers are gray, and branches are black.](phylogenetic_biology_files/figure-latex/time-cladogram-1.pdf) 

Take a look at the cladogram in Figure \@ref(fig:time-cladogram). Consider the red node numbers. The terminal nodes are numbered 1-5, and 6-9 are internal nodes. Of those, the root is node 6. Because the tree is rooted, we know that time proceeds from the root to the tips. If you consider two nodes, where one is descended from the other, then the node closer to the root is older. There are a variety of statements we could make based on this simple relationship, including:

- Node 6 is older than all other nodes in the phylogeny. This is tautological, since the root is by definition the oldest node.
- Node 7 is older than node 9. This is because 9 is descended form 7, and 7 is closer to the root.

We can't make any relative assertions about the ages of nodes that aren't descended from each other. For example, we have no idea of node 8 or node 9 is older.

In practice, these relative statements of age are often quite useful. For example, if Clade A is nested within Clade B, then we know that Clade A is younger than Clade B even if we don't know the ages of any nodes. This may seem trivial, but it is implicit in many discussions of phylogenies.

Note that all of these assertions hold whether or not the tips have the same age. Tips can have different ages in a variety of scenarios, such as a real-time virus phylogeny sampled through the course of a phylogeny or if some tips are fossils.


### Phylograms

Strictly speaking, the only assertions we can make about time on phylograms are those that we can also make on cladograms. This is because we can't be certain of the relationships between time and branch length in the phylogram. If the rate of evolution changes in different regions of the tree, then branches of the same length would not represent time intervals of the same length. It is safest, then, to think of phylograms as cladograms when it comes to discussing time.

### Chronograms

By definition, in a chronogram branch lengths are in units of time. The age of each node is fully specified. This has a couple implications for what we can say about time. We can make ordinal statements, as we did for cladograms and phylograms, but we can also make absolute statements about the interval of time that has elapsed between two nodes. We can also make statements about the relative ages of nodes that are not descended from each other.


## Clock-like evolution

If the rate of evolution were uniform and did not vary in different lineages, then the branch lengths on the phylogram would be proportional to the elapsed time. We could convert from the phylogram to the chronogram just by dividing branch lengths by the rate of change. For example, if the branch lengths are in number of expected DNA substitutions, and the rate of evolutionary change is always 2 substitutions were million years, then dividing each branch length by 2 would give a chronogram where the units of branch length are millions of years. This is called clock-like evolution -- changes in characters are like regular tics on a clock.

Real data are never this tidy, but when evolutionary rates are locally fairly uniform, then phylogram branch lengths will tend to be roughly proportional to the amount of time elapsed according to a locally adjusted clock. This is called a relaxed clock model.

## Time calibration

The process of creating a chronogram is referred to as time calibration. There are a few parts to the process:

- Get a phylogram.
- Constrain the ages of some nodes using external evidence. This can be done by clamping them to a specific age or specifying a distribution of possible ages.
- Adjust branch lengths so that they are consistent with the ages of the clamped nodes, also adjusting the ages of the unclamped nodes as necessary. This is done by fitting clock-like models character change, and adjusting for local variations in rate.
- Assess robustness and confidence in the calibrated node ages and branch lengths.

There are multiply approaches to applying these steps. In the early days of the field, each step was done largely independently. A phylogram would be inferred, dates specified for some nodes, the branches would be stretched or shrunk to get them to fit the calibrations as closely as possible, and then the process would be repeated with slightly different input branch lengths or different calibrations to assess robustness.

The field has been moving toward more integrated approaches, including the simultaneous estimation of all of these features in a [Bayesian framework](https://revbayes.github.io/tutorials/dating/). A Bayesian framework is a very natural way to incorporate diverse information about topology, branch lengths, and evolutionary rates. This has intuitive appeal -- if the calibrations for two nodes indicate that they have a short branch between them, for example, then topologies that place these nodes together should be favored over other that do not.  Constraints on node ages can be incorporated as priors, for example. Unconstrained nodes would have flat priors on age, and constrained nodes would have a sharp peak around a specific age.

### Mathematical implications of age constraints

If all the tips are the same age, then the phylogeny is referred to as being ultrametric -- each tip is the same distance from the root. An ultrametric tree is not necessarily a chronogram, though -- some of the internal nodes may have ages that violate branch lengths proportional to time.

Clamping the ages of tips reduces the number of free parameters in our tree. The way to think about this is that the more information we have, the more constrained and specific our view of the world is. Before we clamp the tip ages, any tip can be any age and all the branches are free to have any length. The ultrametric tree is nested within this set of unconstrained possibilities. The tip ages, and therefore branch lengths, in this unconstrained tree can be selected so that they are ultrametric, but the vast majority of values will lead to trees that are not ultrametric. By clamping some values with added information that some nodes (tips, in this case) are the same age, we now are allowing only a constrained subset of trees and these require fewer parameters to describe.

It is easiest to think of this in terms of branch lengths, rather than node ages. From Section \@ref(tree-properties), we know that the number of branches in a tree is $2n-2$, where $n$ is the number of tips. This is because each of the $n$ tip nodes has an branch leading to it, and each of the $n-1$ internal nodes, with the exception of the root node, has an branch leading to it. So there are $n-2$ branches that give rise to internal nodes. This is how we arrive at our $n+n-2=2n-2$ branches in the phylogeny, each with their own length. In an ultrametric tree, by definition all the tips have the same age. That means that if you know the length of one of the branches leading to a tip node, you can calculate all the others. They have a deterministic relationship and are not free to vary independently. Rather than $n$ branch lengths for the tips, we only have $1$ tip branch length that is free to vary and we can calculate all the others so that the tip nodes have the same ages. This leaves us with $1+n-2=n-1$ branch lengths that we need to estimate independently in our ultrametric tree.


### Constraining node ages

All the tips sampled in the present day have the same age, and we can constrain them accordingly as described above. But to time calibrate our tree we need to constrain nodes at multiple time points. This is what allows us to establish rates that we can use to infer the ages of unconstrained nodes. There are two broad approaches to applying multiple constraints through time. The investigator can either constrain the ages of internal nodes (internal-node-calibrated phylogenies), in which all tips still have the same age, or some tips can be allowed to have ages that precede the present day (tip-calibrated phylogenies). We will illustrate both approaches with an example a study where we have 50 living organisms all sampled in the present day, and 10 fossils sampled across a range of times. We have a morphological character matrix for all, and can infer phylograms that we find to be consistent with a relaxed clock model. 

In an internal-node-calibrated phylogeny, we would infer a phylogeny with all 60 taxa (fossil and extant), note the placement of the fossil taxa, and then infer the phylogeny with only the 50 extant taxa. We would constrain internal nodes so that they are no younger than the oldest fossil that is descended from them. We are considering a phylogeny of only extant taxa, but using the fossils to constrain the minimum age of the clades they belong to. In practice, it is also necessary to place maximum ages on some of the nodes to keep the time calibration from pushing everything way back in time. Given the incompleteness of the fossil record, this is not as straight forward as constraining the minimum age of a node. If we have a fossil we can assert that the clade that contains it can be no younger than that specimen, though it may be much older. But it is harder to assert a maximum age, given that we just might not have fossils for older organisms that existed in the clade. Applying maximum ages often relies on expertise and additional information, such as knowledge that a given land mass where the organisms are exclusively found did not exist before a particular time.

The internal-node-calibrated approach is simplest to implement in some respects, but has a variety of drawbacks. It doesn't make good use of all the available information. By just setting minima on clade ages, it is discarding information about the branch lengths for the fossil taxa. If the branch giving rise to a fossil is long, then we might want to mush the minimum age for a clade much further back than the age of the fossil itself, for example. This approach also doesn't work well has the fraction of fossil taxa increases in the analysis. For example, it wouldn't work at all for a phylogeny comprised exclusively of fossil taxa.

In a tip-calibrated phylogeny, all taxa, fossil and extant, are included as tips in the phylogeny. The age of each tip is then constrained. Any tips from the present day are constrained to have the same present age, and fossil tips are constrained according to external information such as stratigraphy. A relaxed clock is then applied to infer the ages of unconstrained nodes, which also provides inferences of branch lengths. 

<!--chapter:end:time.rmd-->

# Ancestral character state reconstruction

Reconstruction [@joy2016ancestral].



<!--chapter:end:ancestral.rmd-->

# Comparative methods

## Correlated evolutionary changes

PGLS [@symonds2014primer].


![](phylogenetic_biology_files/figure-latex/unnamed-chunk-16-1.pdf)<!-- --> ![](phylogenetic_biology_files/figure-latex/unnamed-chunk-16-2.pdf)<!-- --> 




```
##      [,1] [,2]
## [1,]    1    0
## [2,]    0    1
```

```
##      [,1] [,2]
## [1,]  1.0  0.5
## [2,]  0.5  1.0
```

```
##      [,1] [,2]
## [1,]    1    1
## [2,]    1    1
```
## Inferring covariance in the absence of phylogenetic structure


![](phylogenetic_biology_files/figure-latex/unnamed-chunk-18-1.pdf)<!-- --> 

## Phylogenetic Independent Contrasts





## Phylogenetic structure is the expected covariance structure



<!--chapter:end:comparative.rmd-->

# (APPENDIX) Appendix {-} 

<!--chapter:end:appendix.rmd-->

# Statistical and mathematical fundamentals

Phylogenetic biology draws on a variety of themes in statistics and mathematics. Given the diverse backgrounds of people coming to phylogenetic biology, one of the challenges of introducing people to this field is ensuring a foundation in these fundamentals. Many people have a solid working grasp of many of these topics, others need a refresher, and some have never seen them.

Throughout the text I have covered some of these fundamentals, but here I provide additional resources.

## Probability theory and General statistics {#stats-general}

I put together this short summary of statistical concepts commonly encountered in biology - https://bitbucket.org/caseywdunn/statistics/raw/master/statistics_in_biology.pdf. It is short and technical, with a focus on the relationship between concepts, such as the exponential family of distributions.

## Bayes theorem {#stats-bayes}

Grant Sanderson of 3Blue1Brown provides an excellent introduction to Bayes Theorem and conditional probability in this video - https://youtu.be/HZGCoVF3YvM. Note that he uses $E$ for Evidence rather than $D$ for Data as is common practice in phylogenetic applications.

This video provides additional perspective, including its application to medical testing - https://youtu.be/R13BD8qKeTg.

The MCMC robot by Paul Lewis is an excellent interactive introduction to MCMC sampling - https://phylogeny.uconn.edu/mcmc-robot/.


## Linear algebra {#linear-algebra}

Linear algebra is a rich field of math that springs from a surprisingly simple 
starting point - linear combinations of 
vectors, often represented as rows and columns of matrices. From basic 
operations such as vector addition and scalar multiplication, one can build 
matrix operations and many sophisticated data analyses. Many familiar data 
analysis methods, such as regression, solving systems of equations, 
Principal Component Analyses (PCA), and common clustering methods, are built from linear 
algebra under the hood. So are many aspects of phylogenetic analysis, including 
the models of evolution themselves and the representation of the phylogenetic 
trees in matrix forms that computers can easily manupulate.

Though linear algebra is fundamental to many topics at the intersection of 
science, mathematics, and computation, most science students have far less 
exposure to this critical field than to statistics, calculus, and other 
quantitative topics. This is too bad, as even a basic working knowledge of 
linear algebra can provide great insight into the tools scientists use daily 
and allow us to better apply, implement, and extend them.

The following resources are a good place to start in your own studies of 
linear algebra:

- The Essence of Linear Algebra video series by Grant Sanderson (3Blue1Brown) - https://www.3blue1brown.com/topics/linear-algebra.

- Linear Algebra: Theory, Intuition, Code, by Mike X Cohen. This book is 
accessible to scientists with little past math experience, and is very 
reasonably priced. https://www.amazon.com/Linear-Algebra-Theory-Intuition-Code/dp/9083136604.

- Data Driven Science and Engineering, by Steve Brunton and Nathan Kutz - http://www.databookuw.com/ .
This book shows how linear algebra is applied to many powerful scientific data analyses.
The authors have excellent companion videos organized into playlists at https://www.youtube.com/c/Eigensteve/playlists, including singular value decomposition for Chapter 1, Fourier analyses for chapter 2.

<!--chapter:end:stats.rmd-->

# Software versions

This book was rendered from the source code on Sep 12, 2024 at 01:53:32 PM with the following R package versions.


```
R version 4.2.2 (2022-10-31)
Platform: x86_64-pc-linux-gnu (64-bit)
Running under: Ubuntu 22.04.4 LTS

Matrix products: default
BLAS:   /usr/lib/x86_64-linux-gnu/openblas-pthread/libblas.so.3
LAPACK: /usr/lib/x86_64-linux-gnu/openblas-pthread/libopenblasp-r0.3.20.so

locale:
 [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
 [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
 [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
 [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
 [9] LC_ADDRESS=C               LC_TELEPHONE=C            
[11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       

attached base packages:
[1] stats     graphics  grDevices utils     datasets 
[6] methods   base     

other attached packages:
 [1] scales_1.2.1     ggrepel_0.9.3    kableExtra_1.3.4
 [4] phangorn_2.11.1  Matrix_1.5-1     lubridate_1.9.2 
 [7] forcats_1.0.0    dplyr_1.1.0      purrr_1.0.1     
[10] readr_2.1.4      tidyr_1.3.0      tibble_3.2.0    
[13] ggplot2_3.4.1    tidyverse_2.0.0  stringr_1.5.0   
[16] phytools_1.5-1   maps_3.4.1       magrittr_2.0.3  
[19] gridExtra_2.3    geiger_2.0.10    ape_5.7-1       
[22] ggtree_3.6.2     treeio_1.22.0    bookdown_0.33   

loaded via a namespace (and not attached):
 [1] subplex_1.8             nlme_3.1-160           
 [3] webshot_0.5.4           doParallel_1.0.17      
 [5] httr_1.4.5              numDeriv_2016.8-1.1    
 [7] tools_4.2.2             bslib_0.4.2            
 [9] utf8_1.2.3              R6_2.5.1               
[11] mgcv_1.8-41             lazyeval_0.2.2         
[13] colorspace_2.1-0        withr_2.5.0            
[15] tidyselect_1.2.0        mnormt_2.1.1           
[17] compiler_4.2.2          cli_3.6.0              
[19] rvest_1.0.3             expm_0.999-7           
[21] xml2_1.3.3              labeling_0.4.2         
[23] sass_0.4.5              mvtnorm_1.1-3          
[25] quadprog_1.5-8          systemfonts_1.0.4      
[27] digest_0.6.31           yulab.utils_0.0.6      
[29] rmarkdown_2.20          svglite_2.1.1          
[31] pkgconfig_2.0.3         htmltools_0.5.4        
[33] plotrix_3.8-2           highr_0.10             
[35] fastmap_1.1.1           rlang_1.0.6            
[37] rstudioapi_0.14         optimParallel_1.0-2    
[39] farver_2.1.1            gridGraphics_0.5-1     
[41] jquerylib_0.1.4         generics_0.1.3         
[43] combinat_0.0-8          jsonlite_1.8.4         
[45] ggplotify_0.1.0         patchwork_1.1.2        
[47] Rcpp_1.0.10             munsell_0.5.0          
[49] fansi_1.0.4             lifecycle_1.0.3        
[51] scatterplot3d_0.3-42    stringi_1.7.12         
[53] yaml_2.3.7              clusterGeneration_1.3.7
[55] MASS_7.3-58.1           grid_4.2.2             
[57] parallel_4.2.2          lattice_0.20-45        
[59] splines_4.2.2           hms_1.1.2              
[61] magick_2.7.4            knitr_1.42             
[63] pillar_1.8.1            igraph_1.4.1           
[65] codetools_0.2-18        fastmatch_1.1-3        
[67] glue_1.6.2              evaluate_0.20          
[69] ggimage_0.3.1           ggfun_0.0.9            
[71] deSolve_1.35            png_0.1-8              
[73] vctrs_0.5.2             tzdb_0.3.0             
[75] foreach_1.5.2           gtable_0.3.1           
[77] cachem_1.0.7            xfun_0.37              
[79] tidytree_0.4.2          coda_0.19-4            
[81] viridisLite_0.4.1       iterators_1.0.14       
[83] aplot_0.1.10            timechange_0.2.0       
[85] ellipsis_0.3.2         
```

<!--chapter:end:versions.rmd-->



<!--chapter:end:references.rmd-->

