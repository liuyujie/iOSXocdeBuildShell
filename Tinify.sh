#!/bin/bash
curl https://api.tinify.com/shrink --user api:rJ0yRP-X9ZtEyJo9AjJtJLb9YFjPDEKC --data-binary @mingxinx.jpg | awk -F "url" '{print $2}'|awk -F '"' '{print $3}'