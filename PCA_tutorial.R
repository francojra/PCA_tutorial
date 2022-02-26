# PCA TUtorial ----------------------------------------------------------------------------------------------------------------------------
# Referência: datacamp --------------------------------------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data: 24/02/22 ---------------------------------------------------------------------------------------------------------------------------

# Sobre o PCA --------------------------------------------------------------------------------------------------------------------

# Essa análise costuma ser usada quando existe um grande conjunto de dados com muitas variáveis. Como esses
# dados não podem ser plotados em um formato bruto devido a dificuldade de entender as tendências apresentadas
# pelos dados, é necessário usar as análises multivariadas. O PCA permite ver a forma geral dos dados e compreender
# quais grupos são similares e diferentes uns dos outros.

# A matemática dessa análise é complexa, mas basicamente o PCA toma um conjunto de dados com muitas variáveis e
# simplifica os dados tornando as variáveis orgininais em um pequeno número de "Componentes Principais". Os componentes
# principais são a estrutura subjacente dos dados. São as direções onde há mais variação, as direções onde os dados 
# estão mais espalhados.

# Isso significa que tentamos encontrar a linha reta que melhor distribui os dados quando são projetados ao 
# longo dela. Este é o primeiro componente principal, a linha reta que mostra a variação mais substancial nos dados.

# PCA é um tipo de transformação linear num determinado conjunto de dados que tem valores para um certo número de 
# variáveis (coordenadas) para um certo número de espaços. Esta transformação linear encaixa este conjunto de 
# dados num novo sistema de coordenadas de tal forma que a variância mais significativa é encontrada na primeira 
# coordenada, e cada coordenada subsequente é ortogonal à última e tem uma variância menor. Desta forma, 
# transforma-se um conjunto de x variáveis correlacionadas sobre y amostras para um conjunto de p componentes 
# principais não correlacionados sobre as mesmas amostras.

# Quando muitas variáveis se correlacionam umas com as outras, todas elas contribuirão fortemente para a mesma 
# componente principal. Cada componente principal resume uma certa percentagem da variação total do conjunto de dados. 
# Quando as suas variáveis iniciais estão fortemente correlacionadas entre si, poderá aproximar a maior parte da 
# complexidade do seu conjunto de dados com apenas alguns componentes principais. À medida que adiciona mais 
# componentes principais, vai resumindo cada vez mais o conjunto de dados original. A adição de componentes 
# adicionais torna a sua estimativa do conjunto de dados total mais precisa, mas também mais pesada.

# Eigenvalues and Eigenvectors -------------------------------------------------------------------------------------------------------------

# Tal como muitas coisas na vida, os auto-vectores, e os auto-valores vêm em pares: cada auto-vector tem 
# um auto-valor correspondente. Simplificando, um autovector é uma direcção, tal como "vertical" ou "45 graus", 
# enquanto que um auto-valor é um número que lhe diz quanta variação existe nos dados nessa direcção. 
# O autovector com o auto-valor mais elevado é, portanto, o primeiro componente principal.

# Então espere, há possivelmente mais valores próprios e vectores próprios a serem encontrados num conjunto de dados?

# Isso é correcto! O número de auto-valores e auto-vectores que saem é igual ao número de dimensões que o conjunto 
# de dados tem. No exemplo que viu acima, existiam 2 variáveis, pelo que o conjunto de dados era bidimensional. 
# Isso significa que existem dois autovectores e auto-valores. Da mesma forma, encontraríamos três pares num 
# conjunto de dados tridimensionais.

# Podemos reenquadrar um conjunto de dados em termos destes auto-vectores e auto-valores sem alterar a informação 
# subjacente. Note-se que o reenquadramento de um conjunto de dados relativos a um conjunto de auto-valores e auto-vectores 
# não implica a alteração dos dados em si, apenas se está a olhar para eles de um ângulo diferente, o que deveria 
# representar melhor os dados.

# Sobre o conjunto de dados ----------------------------------------------------------------------------------------------------------------

# In this section, you will try a PCA using a simple and easy to understand dataset. You will use the mtcars dataset, 
# which is built into R. This dataset consists of data on 32 models of car, taken from an American motoring magazine 
# (1974 Motor Trend magazine). For each car, you have 11 features, expressed in varying units (US units).

# Prática PCA - Computar os Componentes Principais ------------------------------------------------------------------------------------------------------------------------------

# Como a PCA funciona melhor com dados numéricos, excluem-se as duas variáveis categóricas (vs e am). Fica com uma 
# matriz de 9 colunas e 32 linhas, que passa para a função prcomp(), atribuindo a sua saída ao mtcars.pca. 
# Também definirá dois argumentos, centro e escala, para ser VERDADEIRO. Depois pode dar uma espreitadela ao seu 
# objecto PCA com sumário().

mtcars.pca <- prcomp(mtcars[,c(1:7,10,11)], center = TRUE, scale. = TRUE)

mtcars
mtcars[,c(1:7,10,11)]
       
summary(mtcars.pca)

# Obtém 9 componentes principais, aos quais chama PC1-9. Cada um deles explica uma percentagem da variação total do 
# conjunto de dados. Isto é, o que quer dizer: PC1 explica 63% da variação total, o que significa que quase dois 
# terços da informação no conjunto de dados (9 variáveis) podem ser encapsulados por apenas um Componente Principal. 
# PC2 explica 23% da variância. Assim, conhecendo a posição de uma amostra em relação a apenas PC1 e PC2, é possível 
# obter uma visão muito precisa sobre a sua posição em relação a outras amostras, pois apenas PC1 e PC2 podem 
# explicar 86% da variância.

str(mtcars.pca)

# O objecto PCA contém as seguintes informações:

## O ponto central ($center), escala ($scale), desvio padrão (sdev) de cada componente principal

## A relação (correlação ou anticorrelação, etc.) entre as variáveis iniciais e os componentes principais ($rotation)

## Os valores de cada amostra em termos dos componentes principais ($x)

# Gráfico PCA ------------------------------------------------------------------------------------------------------------------------------

# Agora você fará um biplot, que inclui tanto a posição de cada amostra em termos de PC1 como de 
# PC2 e também lhe mostrará como as variáveis iniciais se mapeiam para isto. Irá utilizar 
# o pacote ggbiplot, que oferece uma função de fácil utilização e bonita para traçar 
# biplots. Um biplot é um tipo de gráfico que lhe permitirá visualizar como as amostras 
# se relacionam umas com as outras no nosso PCA (que amostras são semelhantes e que são 
# diferentes) e revelará simultaneamente como cada variável contribui para cada componente 
# principal.

library(devtools)
#install_github("vqv/ggbiplot")
library(ggbiplot)

ggbiplot(mtcars.pca)

# Os eixos são vistos como setas originadas do ponto central. Aqui, você vê que as variáveis
# hp, cyl e disp contribuem para PC1, com valores mais altos nessas variáveis movendo as 
# amostras para a direita neste gráfico. Isso permite que você veja como os pontos de dados 
# se relacionam com os eixos, mas não é muito informativo sem saber qual ponto corresponde a 
# qual amostra (carro).

# Você fornecerá um argumento para ggbiplot: vamos fornecer os nomes das linhas de mtcars 
# como rótulos. Isso nomeará cada ponto com o nome do carro em questão:

ggbiplot(mtcars.pca, labels = rownames(mtcars))

# Agora você pode ver quais carros são semelhantes entre si. Por exemplo, o Maserati Bora, 
# o Ferrari Dino e o Ford Pantera L agrupam-se no topo. Isso faz sentido, pois todos são 
# carros esportivos.

# De que outra forma você pode tentar entender melhor seus dados?

# Interpretando os resultados --------------------------------------------------------------------------------------------------------------

# Talvez se você olhar para a origem de cada um dos carros. Você os colocará em uma das três 
# categorias (categorias?), uma para carros americanos, japoneses e europeus. Você faz uma 
# lista para essas informações e passa para o argumento groups do ggbiplot. Você também 
# definirá o argumento da elipse como TRUE, que desenhará uma elipse ao redor de cada grupo.

mtcars.country <- c(rep("Japan", 3), rep("US",4), rep("Europe", 7),rep("US",3), "Europe", 
                    rep("Japan", 3), rep("US",4), rep("Europe", 3), "US", rep("Europe", 3))

ggbiplot(mtcars.pca,ellipse = TRUE,  labels = rownames(mtcars), groups = mtcars.country)

# Agora você vê algo interessante: os carros americanos formam um agrupamento distinto à 
# direita. Olhando para os eixos, você vê que os carros americanos são caracterizados por 
# altos valores para cyl, disp e wt. Os carros japoneses, por outro lado, são caracterizados 
# por alto mpg. Os carros europeus estão um pouco no meio e menos agrupados do que os dois 
# grupos.

# Claro, você tem muitos componentes principais disponíveis, cada um mapeando de forma 
# diferente para as variáveis originais. Você também pode pedir ao ggbiplot para plotar 
# esses outros componentes, usando o argumento de opções.

# Vamos dar uma olhada no PC3 e PC4:

ggbiplot(mtcars.pca, ellipse = TRUE, choices = c(3,4), labels = rownames(mtcars), 
         groups = mtcars.country)

# Você não vê muito aqui, mas isso não é muito surpreendente. PC3 e PC4 explicam porcentagens 
# muito pequenas da variação total, então seria surpreendente se você descobrisse que eles 
# eram muito informativos e separavam os grupos ou revelavam padrões aparentes.

# Vamos recapitular: tendo realizado um PCA usando o conjunto de dados mtcars, podemos ver 
# uma clara separação entre carros americanos e japoneses ao longo de um componente principal 
# que está intimamente relacionado a cyl, disp, wt e mpg. Isso nos fornece algumas pistas 
# para análises futuras; se tentássemos construir um modelo de classificação para identificar 
# a origem de um carro, essas variáveis poderiam ser úteis.

