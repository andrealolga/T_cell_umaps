library(ggplot2)

# Plot UMAP with fewer contour lines for density
ggplot(combined_data_PB, aes(x = UMAP.1.Ungated.E3RH, y = UMAP.2.Ungated.E3RH)) +
  geom_point(aes(color = Subsets), size = 1.5, alpha = 0.5) +
  geom_density_2d(color = "white", size = 0.7, bins = 10) +  # Adjust 'bins' for fewer contours
  labs(x = "UMAP 1", y = "UMAP 2", color = "Subsets") +
  theme_classic() +
  scale_color_manual(values = c("GZMB+" = "red", "NKG2A+" = "blue", "Other CD8+" = "grey")) +
  ggtitle("UMAP Plot of CD8+ PBMC Cells with Subset Overlays") +
  guides(color = guide_legend(override.aes = list(size = 8))) +  # Increase size of legend points
  theme(
    legend.text = element_text(size = 15),  # Increase legend text size
    legend.title = element_text(size = 17),  # Increase legend title size
    axis.title.x = element_text(size = 16),  # Increase x-axis label size
    axis.title.y = element_text(size = 16),  # Increase y-axis label size
    axis.text.x = element_text(size = 16),    # Increase x-axis text size
    axis.text.y = element_text(size = 16),     # Increase y-axis text size
    plot.title = element_text(size = 20)       # Increase title size
  )



library(ggplot2)

# Plot UMAP with fewer contour lines for density
ggplot(combined_data_LN, aes(x = UMAP.1.Ungated.E3RH, y = UMAP.2.Ungated.E3RH)) +
  geom_point(aes(color = Subsets), size = 1.5, alpha = 0.5) +
  geom_density_2d(color = "white", size = 0.7, bins = 10) +  # Adjust 'bins' for fewer contours
  labs(x = "UMAP 1", y = "UMAP 2", color = "Subsets") +
  theme_classic() +
  scale_color_manual(values = c("GZMB+" = "red", "NKG2A+" = "blue", "Other CD8+" = "grey")) +
  ggtitle("UMAP Plot of CD8+ LMC Cells with Subset Overlays") +
  guides(color = guide_legend(override.aes = list(size = 8))) +  # Increase size of legend points
  theme(
    legend.text = element_text(size = 15),  # Increase legend text size
    legend.title = element_text(size = 17),  # Increase legend title size
    axis.title.x = element_text(size = 16),  # Increase x-axis label size
    axis.title.y = element_text(size = 16),  # Increase y-axis label size
    axis.text.x = element_text(size = 16),    # Increase x-axis text size
    axis.text.y = element_text(size = 16),     # Increase y-axis text size
    plot.title = element_text(size = 20)       # Increase title size
  )
