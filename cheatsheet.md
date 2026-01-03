# 🛤️ Rails Naming Conventions & Routing Cheat Sheet

> **Single-source cheat sheet** for Rails beginners.  
> Follow these naming rules, and Rails becomes predictable instead of confusing.

---

## 📋 Table of Contents

- [Core Mental Model](#-core-mental-model)
- [Models](#-models-singular)
- [Database Tables](#-database-tables-plural)
- [Migrations](#-migrations)
- [Controllers](#-controllers-plural)
- [Routes](#-routes-plural)
- [Route Helpers](#-route-helpers)
- [Forms](#-forms-singular)
- [Associations](#-associations)
- [Views](#-views-folder-plural)
- [Instance Variables](#-instance-variables)
- [HTML vs Rails Form Helpers](#-html-vs-rails-form-helpers)
- [Golden Rules](#-golden-rules)
- [Quick Reference Table](#-quick-reference-table)
- [Common Commands](#-common-commands)

---

## 🧠 Core Mental Model

| Concept | Meaning |
|---------|---------|
| **Singular** | One object |
| **Plural** | Collection of objects |

Rails applies this rule **everywhere**.

---

## 📦 Models (Singular)

Represents **one record** from the database.

```ruby
class User < ApplicationRecord
end

class Article < ApplicationRecord
end
```

### Rules:
- ✅ **Singular** name
- ✅ **PascalCase**

---

## 🗄️ Database Tables (Plural)

Stores **many records**.

```
users
articles
orders
```

### Rails Mapping:
| Model | Table |
|-------|-------|
| `User` | `users` |
| `Article` | `articles` |
| `Order` | `orders` |

---

## 🔧 Migrations

### Create Table (Plural)

```bash
rails g migration CreateUsers
```

```ruby
create_table :users do |t|
  t.string :name
  t.timestamps
end
```

### Add Column (Plural table, Singular column)

```bash
rails g migration AddEmailToUsers email:string
```

```ruby
add_column :users, :email, :string
```

### Rules:
- ✅ Table name → **plural**
- ✅ Column name → **singular**

---

## 🎮 Controllers (Plural)

Controllers handle **collections** of resources.

```ruby
class UsersController < ApplicationController
end

class ArticlesController < ApplicationController
end
```

### File Location:
```
app/controllers/users_controller.rb
app/controllers/articles_controller.rb
```

---

## 🛣️ Routes (Plural)

```ruby
# config/routes.rb
resources :articles
```

### Creates these RESTful routes:

| HTTP Method | Path | Controller#Action | Purpose |
|-------------|------|-------------------|---------|
| `GET` | `/articles` | `articles#index` | List all articles |
| `GET` | `/articles/new` | `articles#new` | Show new form |
| `POST` | `/articles` | `articles#create` | Create article |
| `GET` | `/articles/:id` | `articles#show` | Show one article |
| `GET` | `/articles/:id/edit` | `articles#edit` | Show edit form |
| `PATCH/PUT` | `/articles/:id` | `articles#update` | Update article |
| `DELETE` | `/articles/:id` | `articles#destroy` | Delete article |

---

## 🔗 Route Helpers

Generated automatically from your routes.

| Action | Helper | Usage |
|--------|--------|-------|
| index | `articles_path` | Link to all articles |
| new | `new_article_path` | Link to new form |
| show | `article_path(@article)` | Link to one article |
| edit | `edit_article_path(@article)` | Link to edit form |
| create | `articles_path` | Form submission |
| update | `article_path(@article)` | Form submission |
| destroy | `article_path(@article)` | Delete action |

### Rules:
- 📚 **Collection** → plural helper (`articles_path`)
- 📄 **Single record** → singular helper (`article_path`)

---

## 📝 Forms (Singular)

Forms always deal with **one object**.

### ✅ Correct:

```html
<input name="article[title]">
<input name="article[body]">
```

### Params received:

```ruby
params[:article][:title]
params[:article][:body]
```

### ❌ Incorrect:

```html
<input name="articles[title]">
```

### Why `article` and NOT `articles` in forms?

> A form edits **one Article** at a time.  
> Even though it saves to the `articles` table, use singular in forms.

```
✅ article[attribute]
❌ articles[attribute]
```

### Example: New → Create Flow

```
GET  /articles/new   → articles#new   (displays form)
POST /articles       → articles#create (processes form)
```

```erb
<%= form_with model: @article, local: true do |f| %>
  <%= f.text_field :title %>
  <%= f.text_area :body %>
  <%= f.submit %>
<% end %>
```

---

## 🔗 Associations

### `has_many` (Plural)

```ruby
class User < ApplicationRecord
  has_many :articles
end
```

### `belongs_to` (Singular)

```ruby
class Article < ApplicationRecord
  belongs_to :user
end
```

### `has_one` (Singular)

```ruby
class User < ApplicationRecord
  has_one :profile
end
```

### Foreign Keys (Singular)

```
user_id      # article belongs to ONE user
article_id   # comment belongs to ONE article
category_id  # product belongs to ONE category
```

> Each record belongs to **one** parent, hence singular.

---

## 📁 Views Folder (Plural)

```
app/views/articles/
├── index.html.erb
├── new.html.erb
├── edit.html.erb
├── show.html.erb
├── _form.html.erb      # partial (prefixed with _)
└── _article.html.erb   # partial for single article
```

> Folder name **matches controller name**.

---

## 🏷️ Instance Variables

### Collection (Plural):

```ruby
# In controller
@articles = Article.all

# In view
<% @articles.each do |article| %>
  <%= article.title %>
<% end %>
```

### Single Object (Singular):

```ruby
# In controller
@article = Article.find(params[:id])

# In view
<%= @article.title %>
```

---

## 🆚 HTML vs Rails Form Helpers

### Valid Raw HTML:

```html
<form action="/articles" method="post">
  <label for="article_title">Title</label>
  <input type="text" name="article[title]" id="article_title">
  <button type="submit">Create</button>
</form>
```

### Rails Helper Equivalent:

```erb
<%= form_with model: @article, local: true do |f| %>
  <%= f.label :title %>
  <%= f.text_field :title %>
  <%= f.submit "Create" %>
<% end %>
```

### Rails helpers provide:
- ✅ Auto-fill values on validation errors
- ✅ Automatic error handling
- ✅ CSRF protection
- ✅ Correct HTTP methods (`PATCH`, `DELETE` via hidden field)

---

## ⭐ Golden Rules

> **MEMORIZE THESE!**

| Component | Naming |
|-----------|--------|
| Model | **Singular** (`User`) |
| Table | **Plural** (`users`) |
| Controller | **Plural** (`UsersController`) |
| Routes | **Plural** (`resources :users`) |
| Form params | **Singular** (`user[name]`) |
| Columns | **Singular** (`email`, `name`) |
| Foreign keys | **Singular** (`user_id`) |
| Views folder | **Plural** (`app/views/users/`) |
| `has_many` | **Plural** (`has_many :articles`) |
| `belongs_to` | **Singular** (`belongs_to :user`) |

---

## 📊 Quick Reference Table

```
┌─────────────────────────────────────────────────────────────┐
│                    RAILS NAMING RULES                       │
├─────────────────────────────────────────────────────────────┤
│  SINGULAR (One thing)    │  PLURAL (Many things)            │
├──────────────────────────┼──────────────────────────────────┤
│  Model: User             │  Table: users                    │
│  belongs_to :user        │  has_many :articles              │
│  Foreign key: user_id    │  Controller: UsersController     │
│  Form: user[email]       │  Routes: resources :users        │
│  @article                │  @articles                       │
│  article_path(@article)  │  articles_path                   │
└──────────────────────────┴──────────────────────────────────┘
```

---

## 💡 Pro Tips

1. **When in doubt**: Ask yourself "Am I dealing with ONE or MANY?"
2. **Use `rails routes`**: See all generated routes with `rails routes` in terminal
3. **Naming generators**: Let Rails handle naming - `rails g model User` automatically creates `users` table
4. **Partials**: Use `_singular.html.erb` for rendering individual items (e.g., `_article.html.erb`)

---

## 🔍 Common Mistakes to Avoid

| ❌ Mistake | ✅ Correct |
|-----------|-----------|
| `class Users` | `class User` |
| `create_table :user` | `create_table :users` |
| `class UserController` | `class UsersController` |
| `resources :article` | `resources :articles` |
| `params[:articles]` | `params[:article]` |
| `has_many :article` | `has_many :articles` |
| `belongs_to :users` | `belongs_to :user` |

---

## 🛠️ Common Commands

```bash
# Generate a scaffold (creates model, controller, views, routes)
rails generate scaffold Article title:string description:text

# Run migrations
rails db:migrate

# Check all routes
rails routes --expanded

# Generate model only
rails g model User name:string email:string

# Generate controller only
rails g controller Articles index show new create

# Generate migration
rails g migration AddEmailToUsers email:string

# Rails console
rails console

# Start server
rails server
```

---

## 📖 One-Line Summary

> **Rails naming is based on "one vs many"**:  
> One thing → **singular** | Many things → **plural**

---

## 📚 Additional Resources

- [Rails Guides: Routing](https://guides.rubyonrails.org/routing.html)
- [Rails Guides: Active Record Basics](https://guides.rubyonrails.org/active_record_basics.html)
- [Rails Guides: Form Helpers](https://guides.rubyonrails.org/form_helpers.html)
- [Rails Guides: Naming Conventions](https://guides.rubyonrails.org/active_record_basics.html#naming-conventions)

---

<p align="center">
  <strong>Happy Rails coding! 🚂</strong>
</p>