####This script can be used to create a set of bootstraps based on a supplied list of mutations and sequence lengths (ACR length).
import random

# Define the input lists of mutations and lengths
mutations = [36, 33, 157, 40, 51, 83, 41, 64, 33, 12, 28, 63, 61, 10, 12, 78, 41, 13, 62, 38, 19, 56, 13, 12, 17, 14, 70, 27, 43, 17, 79, 65, 33, 37, 11, 13, 15, 19, 12, 8, 79, 21, 17, 38, 14, 18, 22, 12, 27, 10, 59, 16, 35, 32, 31, 55, 15, 13, 14, 23, 127, 22, 166, 38, 70, 26, 175, 76, 68, 12, 19, 6, 16, 6, 53, 74, 50, 27, 17, 16, 33, 71, 10, 112, 93, 12, 21, 44, 13, 9, 33, 86, 14, 154, 46, 53, 5, 9, 74, 89, 18, 64, 54, 11, 23, 66, 34, 15, 44, 25, 188, 56, 103, 157, 285, 11, 28, 104, 41, 49, 113, 88, 30, 62, 109, 12, 13, 57, 33, 53, 47, 52, 12, 257, 8, 17, 32, 61, 13, 11, 19, 8, 10, 20, 54, 14, 49, 11, 71, 295, 11, 93, 70, 223, 31, 18, 10, 5, 12, 23, 41, 12, 56, 15, 25, 21, 23, 24, 21, 63, 79, 35, 89, 11, 44, 9, 73, 10, 26, 114, 36, 100, 111, 13, 25, 104, 7, 7, 102, 14, 17, 8, 14, 15, 7, 5, 38, 19, 5, 119, 141, 132, 27, 56, 32, 29, 35]
lengths = [5206, 4744, 4054, 3770, 3959, 5957, 4228, 5849, 4085, 5742, 4786, 4259, 5915, 3821, 4781, 4634, 4100, 5366, 4511, 6437, 5831, 6557, 7877, 4812, 4902, 4212, 4550, 5108, 4819, 5117, 4628, 4985, 4517, 3878, 4973, 4584, 5615, 5257, 5626, 5249, 4304, 4424, 6881, 4583, 4838, 5684, 5369, 4826, 5987, 4922, 4067, 3785, 4868, 4883, 4280, 5234, 4758, 3875, 6854, 4568, 4805, 4328, 6800, 4775, 6353, 5450, 5765, 6664, 5366, 4775, 6383, 4855, 4962, 4892, 4636, 4579, 5845, 4291, 5332, 4741, 5128, 4285, 5386, 5521, 4769, 5734, 4387, 4429, 5557, 4207, 4054, 3985, 4300, 5791, 4522, 4855, 4372, 4069, 4444, 4424, 4672, 4912, 4531, 5329, 5608, 6088, 7519, 5713, 4330, 3973, 4210, 4954, 5542, 6628, 5407, 4597, 6418, 4162, 5560, 4582, 4174, 5374, 4813, 4624, 5914, 4783, 5383, 4048, 4408, 4375, 4370, 4327, 5230, 4300, 3691, 6087, 6930, 5288, 4953, 4314, 5367, 4479, 5433, 4965, 4692, 4836, 4254, 4599, 5010, 4156, 4833, 4881, 5451, 5709, 4740, 7530, 5115, 5301, 5418, 4824, 4744, 5049, 5475, 4955, 5889, 4131, 3777, 3771, 4374, 4969, 4813, 5090, 4513, 6265, 4270, 3976, 4415, 5671, 5164, 4972, 5230, 5332, 4057, 6311, 3733, 9112, 4087, 4802, 5011, 4388, 5008, 4900, 5025, 4062, 4869, 6124, 5298, 6018, 4674, 6021, 6048, 5226, 4264, 4272, 5061, 4056, 4482, 4677, 4222, 6016, 5742, 4104, 4863, 5280, 4867, 6682, 5601, 5433, 4047, 4151, 5187, 4864, 5231, 6643, 7880, 4418]


# Define the resampling function
def resample_mutations(mutations, lengths, num_samples):
    # Initialize an empty list to store the resampled rates
    resampled_rates = []
    
    # Resample the mutations per site and calculate the rate for each sample
    for i in range(num_samples):
        resampled_mutations = [random.choices(mutations, k=lengths[j])[0] for j in range(len(lengths))]
        resampled_rates.append(sum(resampled_mutations) / sum(lengths))
    
    # Calculate the mean and standard deviation of the resampled rates
    mean_rate = sum(resampled_rates) / len(resampled_rates)
    std_dev = (sum([(rate - mean_rate)**2 for rate in resampled_rates]) / (len(resampled_rates) - 1))**0.5
    
    # Return the resampled rates, mean rate, and standard deviation
    return resampled_rates, mean_rate, std_dev

# Call the resampling function with 1000 samples
resampled_rates, mean_rate, std_dev = resample_mutations(mutations, lengths, 1000)

# Print the results
print("Resampled Rates:", resampled_rates)
print("Mean Rate:", mean_rate)
print("Standard Deviation:", std_dev)

resampled_mutations = [random.randint(0, length) for length in resampled_lengths]
