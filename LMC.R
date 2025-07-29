#Alternative 1
# Load necessary libraries
library(ggplot2)
library(dplyr)

# Read the CSV files
data_all <- read.csv("export_concat_ALL_1_LN.csv")
data_cxcr5 <- read.csv("export_concat_ALL_1_LN_CXCR5+.csv")
data_gzmb <- read.csv("export_concat_ALL_1_LN_GZMB+.csv")
data_nkg2a <- read.csv("export_concat_ALL_1_LN_NKG2A+.csv")

# Ensure FlowSOM is numeric
data_all$FlowSOM <- as.numeric(data_all$FlowSOM)

# Create subsets
data_cxcr5$Subsets <- "CXCR5+"
data_gzmb$Subsets <- "GZMB+"
data_nkg2a$Subsets <- "NKG2A+"

# Combine datasets
combined_data <- bind_rows(data_all %>% mutate(Subsets = "Other CD8+"),
                           data_cxcr5,
                           data_gzmb,
                           data_nkg2a)

# Count the cells in each category after the mutation
subset_counts <- table(combined_data$Subsets)
print(subset_counts)

# Plot UMAP
ggplot(combined_data, aes(x = UMAP.1.Ungated.JXS6, y = UMAP.2.Ungated.JXS6, color = Subsets)) +
  geom_point(size = 0.6, alpha = 0.5) +
  labs(x = "UMAP 1", y = "UMAP 2", color = "Subsets") +
  theme_classic() +
  scale_color_manual(values = c("CXCR5+" = "blue", "GZMB+" = "red", "NKG2A+" = "green", "Other" = "grey")) +
  ggtitle("UMAP Plot of Lymph Node Cells with CXCR5+, GZMB+, and NKG2A+Subset Overlays")


#####################################################################################################################

# Plot UMAP with overlays for CXCR5+, GZMB+, and NKG2A+ subsets
ggplot(combined_data, aes(x = UMAP.1.Ungated.JXS6, y = UMAP.2.Ungated.JXS6, color = Subsets)) +
  geom_point(size = 0.7, alpha = 0.5) +  # Point size can also be adjusted
  labs(x = "UMAP 1", y = "UMAP 2", color = "Subsets") +
  theme_classic() +
  scale_color_manual(values = c("CXCR5+" = "green", "GZMB+" = "red", "NKG2A+" = "blue", "Other" = "grey")) +
  ggtitle("UMAP Plot of Lymph Node Cells with Subset Overlays") +
  guides(color = guide_legend(override.aes = list(size = 6))) +  # Increase size of legend points
  theme(legend.text = element_text(size = 12),  # Increase legend text size
        legend.title = element_text(size = 14))  # Increase legend title size

#####################################################################################################################

###adjust contours 

  library(ggplot2)
  
  # Plot UMAP with fewer contour lines for density
  ggplot(combined_data, aes(x = UMAP.1.Ungated.JXS6, y = UMAP.2.Ungated.JXS6)) +
    geom_point(aes(color = Subsets), size = 1.5, alpha = 0.5) +
    geom_density_2d(color = "white", size = 0.7, bins = 10) +  # Adjust 'bins' for fewer contours
    labs(x = "UMAP 1", y = "UMAP 2", color = "Subsets") +
    theme_classic() +
    scale_color_manual(values = c("CXCR5+" = "green", "GZMB+" = "red", "NKG2A+" = "blue", "Other CD8+" = "grey")) +
    ggtitle("UMAP Plot of CD8+ PBMC Cells with Subset Overlays") +
    guides(color = guide_legend(override.aes = list(size = 8))) +  # Increase size of legend points
    theme(
      legend.text = element_text(size = 15),  # Increase legend text size
      legend.title = element_text(size = 17),  # Increase legend title size
      axis.title.x = element_text(size = 16),  # Increase x-axis label size
      axis.title.y = element_text(size = 16),  # Increase y-axis label size
      axis.text.x = element_text(size = 16),    # Increase x-axis text size
      axis.text.y = element_text(size = 16)     # Increase y-axis text size
    )


###################################################################################################################
###Automatic

# Plot UMAP with only contour lines for density
ggplot(combined_data, aes(x = UMAP.1.Ungated.JXS6, y = UMAP.2.Ungated.JXS6)) +
  geom_point(aes(color = Subsets), size = 0.6, alpha = 0.5) +
  geom_density_2d(color = "grey", size = 0.5) +  # Add contour lines without filling
  labs(x = "UMAP 1", y = "UMAP 2", color = "Subsets") +
  theme_classic() +
  scale_color_manual(values = c("CXCR5+" = "green", "GZMB+" = "red", "NKG2A+" = "blue", "Other" = "grey")) +
  ggtitle("UMAP Plot of Lymph Node Cells with Contour Lines") +
  guides(color = guide_legend(override.aes = list(size = 6))) +  # Increase size of legend points
  theme(legend.text = element_text(size = 12),  # Increase legend text size
        legend.title = element_text(size = 14))  # Increase legend title size






















