import yaml
import git
import sys

def main():
    # Default ansible site.yml path
    yml_path = './ansible/site.yml'
    try:
        yml_path = sys.argv[1]
    except:
        print('No yml file passed as argument, using default')
    install_roles(read_yml(yml_path))

def read_yml(file_path):
    with open(file_path) as f:
        data = yaml.load(f, Loader=yaml.FullLoader)
        roles = []
        for item in data:
            for role in item['roles']:
                roles.append(role)
        return roles

# Clone roles from github to the ./ansible/roles/ directory
def install_roles(roles):
    for role in roles:
        split_role = role.split(".")
        if len(split_role) >= 2:
            owner = split_role[0]
            role = split_role[1]
            repo_url = f'https://github.com/{owner}/ansible-role-{role}'
            alt_repo_url = f'https://github.com/{owner}/ansible-{role}'
            install_path = f'./ansible/roles/{owner}.{role}'
            try:
                git.Repo.clone_from(url=repo_url, to_path=install_path)
            except:
                try:
                    git.Repo.clone_from(url=alt_repo_url, to_path=install_path)
                except git.exc.GitCommandError as error:
                    print(error)

if __name__ == "__main__":
    main()