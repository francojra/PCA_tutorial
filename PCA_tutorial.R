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
# O autovector com o valor próprio mais elevado é, portanto, o primeiro componente principal.


