# Summary
A simplified Docker stack for `Tandoor` recipes.

NOTE: This does NOT use a Nginx to serve media from Tandoor. This can result in performance issues, however, this may not effect small scale set ups.


Run the following command for the `SECRET_KEY` environment variable:
```
base64 /dev/urandom | head -c50
```

## References
- [Tandoor Recipes GitHub](https://github.com/TandoorRecipes/)