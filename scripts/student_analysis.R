# scripts/student_analysis.R

# Load required packages
library(knitr)

# Create output folder if needed
if (!dir.exists("outputs/plots")) {
  dir.create("outputs/plots", recursive = TRUE, showWarnings = FALSE)
}

# Read student dataset
student_data <- read.csv("data/students.csv")

# Preview data
cat("Dataset preview:\n")
print(head(student_data))

cat("\nDataset structure:\n")
str(student_data)

cat("\nSummary statistics:\n")
print(summary(student_data))

# Check for missing values
cat("\nMissing values by column:\n")
print(colSums(is.na(student_data)))

# Clean and standardize columns
student_data <- unique(student_data)
student_data$Gender <- as.factor(student_data$Gender)
student_data$Course <- as.factor(student_data$Course)
student_data$Department <- as.factor(student_data$Department)
student_data$CGPA <- as.numeric(student_data$CGPA)

# Descriptive stats
cgpa_mean <- mean(student_data$CGPA, na.rm = TRUE)
cgpa_median <- median(student_data$CGPA, na.rm = TRUE)
cgpa_sd <- sd(student_data$CGPA, na.rm = TRUE)
cgpa_min <- min(student_data$CGPA, na.rm = TRUE)
cgpa_max <- max(student_data$CGPA, na.rm = TRUE)

cat("\nCGPA summary:\n")
print(cbind(
  Mean = cgpa_mean,
  Median = cgpa_median,
  SD = cgpa_sd,
  Min = cgpa_min,
  Max = cgpa_max
))

# Gender counts
gender_count <- table(student_data$Gender)
cat("\nGender distribution:\n")
print(gender_count)

pie(
  gender_count,
  main = "Gender Distribution",
  labels = paste(names(gender_count), gender_count),
  col = c("lightblue", "pink")
)

# Save plot
png("outputs/plots/gender_distribution.png", width = 800, height = 600)
pie(
  gender_count,
  main = "Gender Distribution",
  labels = paste(names(gender_count), gender_count),
  col = c("lightblue", "pink")
)
dev.off()

# Course counts
course_count <- table(student_data$Course)
cat("\nCourse distribution:\n")
print(course_count)

barplot(
  course_count,
  main = "Student Distribution by Course",
  xlab = "Course",
  ylab = "Number of Students",
  las = 2,
  col = "steelblue"
)

png("outputs/plots/course_distribution.png", width = 900, height = 600)
barplot(
  course_count,
  main = "Student Distribution by Course",
  xlab = "Course",
  ylab = "Number of Students",
  las = 2,
  col = "steelblue"
)
dev.off()

# CGPA histogram
hist(
  student_data$CGPA,
  main = "Distribution of Student CGPA",
  xlab = "CGPA",
  ylab = "Number of Students",
  col = "lightgreen",
  border = "white"
)

png("outputs/plots/cgpa_distribution.png", width = 800, height = 600)
hist(
  student_data$CGPA,
  main = "Distribution of Student CGPA",
  xlab = "CGPA",
  ylab = "Number of Students",
  col = "lightgreen",
  border = "white"
)
dev.off()

# Average CGPA by course
course_cgpa <- aggregate(CGPA ~ Course, data = student_data, FUN = mean)
cat("\nAverage CGPA by course:\n")
print(course_cgpa)

barplot(
  course_cgpa$CGPA,
  names.arg = course_cgpa$Course,
  main = "Average CGPA by Course",
  xlab = "Course",
  ylab = "Average CGPA",
  las = 2,
  col = "gold"
)

png("outputs/plots/average_cgpa_by_course.png", width = 900, height = 600)
barplot(
  course_cgpa$CGPA,
  names.arg = course_cgpa$Course,
  main = "Average CGPA by Course",
  xlab = "Course",
  ylab = "Average CGPA",
  las = 2,
  col = "gold"
)
dev.off()

cat("\nAnalysis completed successfully. Plots saved in outputs/plots/.\n")
