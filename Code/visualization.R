############
# Visualization - thesis
# Author: Letícia Marçal Russo
############

# Libraries 
library(ggplot2)
library(readxl)
library(gridExtra)

# Read xlsx file
questions_df <- read_excel('analysis_df_filtered.xlsx')

# Scatter plot SBERT + TED
sbert_ted <- ggplot(questions_df, aes(x = question_sim_SBERT, y = parse_tree_dist)) +
  geom_point(color = 'blue') + # Scatter plot
  geom_smooth(method = 'lm', se = FALSE, color = 'black') + # Add line with trend
  labs(x = 'SBERT + cosine', y = 'Tree Edit Distancing') +  # Change variable names
  ggtitle('SBERT on questions x TED on parse trees') +  # Add a title
  theme_minimal()

print(sbert_ted)  # Display the plot

### Correlation

# Subset the df to include only the two columns of interest
subset_df <- questions_df[, c('question_sim_SBERT', 'parse_tree_dist')]

# Calculate the correlation matrix
correlation_matrix <- cor(subset_df)

# Print the correlation matrix
print(correlation_matrix)


#### TED = 0

sbert_ted <- ggplot(questions_df, aes(x = question_sim_SBERT, y = parse_tree_dist)) +
  geom_point(aes(color = factor(parse_tree_dist == 0)), shape = 21, fill = 'gray', color = 'gray', size = 3) +
  geom_point(data = subset(questions_df, parse_tree_dist == 0), color = 'blue', shape = 21, fill = 'blue', size = 3) +
  geom_smooth(method = 'lm', se = FALSE, color = 'black') +
  labs(x = 'SBERT + cosine', y = 'Tree Edit Distance') +
  ggtitle('SBERT on questions x TED on parse trees') +
  theme_minimal()

sbert_ted



