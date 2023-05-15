import random

# Define the input lists of mutations and lengths
#mutations = [24, 15, 21, 14, 10, 26, 335, 50, 18, 237, 117, 15, 18, 8, 12, 14, 21, 9, 5, 15,$mutations = [24, 15, 21, 14, 10, 26, 335, 50, 18, 237, 117, 15, 18, 8, 12, 14, 21, 9, 5, 15, $

lengths = [9573, 4391, 6119, 4757, 4109, 6701, 5533, 4739, 5010, 4687, 6555, 5684, 4955, 4231$


# Define the resampling function
def resample_mutations(mutations, lengths, num_samples):
    # Initialize an empty list to store the resampled rates
    resampled_rates = []

    # Resample the mutations per site and calculate the rate for each sample
    for i in range(num_samples):
        resampled_mutations = [random.choices(mutations, k=lengths[j])[0] for j in range(len($        resampled_rates.append(sum(resampled_mutations) / sum(lengths))

    # Calculate the mean and standard deviation of the resampled rates
    mean_rate = sum(resampled_rates) / len(resampled_rates)
    std_dev = (sum([(rate - mean_rate)**2 for rate in resampled_rates]) / (len(resampled_rate$

    # Return the resampled rates, mean rate, and standard deviation
    return resampled_rates, mean_rate, std_dev

# Call the resampling function with 10000 samples
resampled_rates, mean_rate, std_dev = resample_mutations(mutations, lengths, 10000)



