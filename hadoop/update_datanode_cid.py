import re
import os


def extract_cluster_id(file_path):
    """
    Extracts the cluster ID from a file at the given path.

    :param file_path: Path to the file containing the cluster ID
    :return: The cluster ID as a string if found, otherwise None
    """
    # Define the pattern to match the clusterID (CID- followed by a UUID)
    cluster_id_pattern = r"clusterID=CID-[0-9a-fA-F-]+"

    try:
        with open(file_path, "r") as file:
            content = file.read()

            # Search for the pattern in the content
            match = re.search(cluster_id_pattern, content)
            if match:
                return match.group(0).split("=")[
                    1
                ]  # Return the part after 'clusterID='
            else:
                print(f"No clusterID found in {file_path}")
                return None
    except Exception as e:
        print(f"Error reading file {file_path}: {e}")
        return None


def paste_cluster_id_into_files(cluster_id, file_path):
    """
    Pastes the extracted cluster ID into the file at the provided file path.
    If the cluster ID already exists, it updates the value. Otherwise, it appends the cluster ID.

    :param cluster_id: The cluster ID to paste into the file
    :param file_path: Path to the file where to paste the cluster ID
    """
    if not cluster_id:
        print("No cluster ID to paste. Exiting...")
        return

    try:
        with open(file_path, "r") as file:
            content = file.read()

        cluster_id_pattern = r"clusterID=CID-[0-9a-fA-F-]+"
        if re.search(cluster_id_pattern, content):
            # Replace the existing clusterID
            new_content = re.sub(cluster_id_pattern, f"clusterID={cluster_id}", content)
            print(f"Cluster ID updated in {file_path}")
        else:
            # Append the new clusterID
            new_content = content + f"\nclusterID={cluster_id}\n"
            print(f"Cluster ID appended to {file_path}")

        with open(file_path, "w") as file:
            file.write(new_content)

    except Exception as e:
        print(f"Error processing file {file_path}: {e}")


def main():
    NUM_DATANODES = 2

    base_dir = os.path.dirname(os.path.abspath(__file__))

    source_file_path = os.path.join(
        base_dir, "namenode", "current", "VERSION"
    )  # Path to the file containing the cluster ID

    for i in range(NUM_DATANODES):
        target_file_path = os.path.join(
            base_dir, "node-" + str(i + 1), "data", "current", "VERSION"
        )

        paste_cluster_id_into_files(
            extract_cluster_id(source_file_path), target_file_path
        )


if __name__ == "__main__":
    main()
