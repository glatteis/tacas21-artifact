# This converts a concatenation of files to a slurm array job.
# Why I used it: to convert the lists of commands in run_all_*_*.sh into a big array job like this:

# cat run_all_derivative_0.05.sh run_all_derivative_0.1.sh run_all_vanilla_0.05.sh run_all_vanilla_0.1.sh run_all_integrated_0.05.sh run_all_integrated_0.1.sh | python3 scripts_to_array_job.py > run_all_slurm.sh
import fileinput

i = 0
for line in fileinput.input():
    if not line.startswith("./"):
        continue
    print("if [[ \"$SLURM_ARRAY_TASK_ID\" -eq " + str(i) + " ]]")
    print("then")
    print(line)
    print("fi")
    i += 1