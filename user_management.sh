#!/bin/bash


RED=$'\033[0;31m'
GREEN=$'\033[0;32m'
YELLOW=$'\033[0;33m'
BLUE=$'\033[0;34m'
CYAN=$'\033[0;36m'
NC=$'\033[0m' # No Color

clear

echo -e "${CYAN}==================================${NC}"
echo -e "${BLUE}      USER MANAGEMENT SYSTEM      ${NC}"
echo -e "${CYAN}==================================${NC}"

echo -e "${YELLOW}1. Create a New User${NC}"
echo -e "${YELLOW}2. Delete User${NC}"
echo -e "${YELLOW}3. View All System Users${NC}"
echo -e "${YELLOW}4. Exit${NC}"

read -p "Enter your choice: " choice

case $choice in
    1)
        read -p "Write new username: " username
        sudo useradd -m $username
        echo -e "${GREEN}[+] User '$username' Successfully created${NC}"
        ;;
    2)
        read -p "Which user do you want to delete? " username
        sudo userdel -r $username
        echo -e "${RED}[-] User '$username' Successfully deleted.${NC}"
        ;;
    3)
        echo -e "${BLUE}Displaying all registered users:${NC}"
        cut -d: -f1 /etc/passwd | tail -n 10
        ;;
    4)
        echo -e "${YELLOW}Exiting... Thanks!${NC}"
        exit
        ;;
    *)
        echo -e "${RED}Invalid choice!${NC}"
        ;;
esac
