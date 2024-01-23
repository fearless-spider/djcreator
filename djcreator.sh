#!/bin/sh

gum style \
	--foreground 201 --border-foreground 201 --border double \
	--align center --width 50 --margin "1 2" --padding "2 4" \
	'Django Creator .::. PAJAK'

TYPE=$(gum choose "clean" "auth" "oscar")

if [ $TYPE = "clean" ]; then
	gum confirm "It will create new python env with latest Django and it will create new project. Are you sure?"

	if [ $? -eq 0 ]; then
		python -m venv djvenv
		./djvenv/bin/pip install --upgrade pip
		./djvenv/bin/pip install django django-bootstrap-v5 django-debug-toolbar
		PROJECT_NAME=$(gum input --placeholder "Name of Django project")
		./djvenv/bin/django-admin startproject "$PROJECT_NAME"
	fi
elif [ $TYPE = "auth" ]; then
	gum confirm "It will create new python env with latest Django and it will create new project with login and register sections. Are you sure?"

	if [ $? -eq 0 ]; then
		python -m venv djvenv
		./djvenv/bin/pip install --upgrade pip
		./djvenv/bin/pip install django django-bootstrap-v5 django-debug-toolbar django-registration
		PROJECT_NAME=$(gum input --placeholder "Name of Django project")
		./djvenv/bin/django-admin startproject "$PROJECT_NAME"
	fi
elif [ $TYPE = "oscar" ]; then
	gum confirm "It will create new python env with latest Django and it will create new project with Oscar framework. Are you sure?"

	if [ $? -eq 0 ]; then
		python -m venv djvenv
		./djvenv/bin/pip install --upgrade pip
		./djvenv/bin/pip install django django-bootstrap-v5 django-debug-toolbar django-oscar[sorl-thumbnail]
		PROJECT_NAME=$(gum input --placeholder "Name of Django project")
		./djvenv/bin/django-admin startproject "$PROJECT_NAME"
	fi
fi

gum style \
	--foreground 201 --border-foreground 201 --border double \
	--align center --width 50 --margin "1 2" --padding "2 4" \
	'Done!'
