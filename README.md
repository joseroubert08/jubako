# Jubako

### ***[WARNING] Jubako is under developing. Current version has not test. Don't use this gem!***

Jubako gives multi-level layout inheritance in Rails view, like [Jade's template inheritance](http://jade-lang.com/reference/inheritance/).


## Installation

Add this line to your Rails application's Gemfile:

```ruby
gem 'jubako'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jubako


## Usage

These usage are using [Slim](https://github.com/slim-template/slim).

### Layout (Template) inheritance

Jubako defines `extends` method in view helper. When you call `extends` with layout path (in anywhere of view), it will render with using specified layout.

Have you specified any layout before rendering? It applies after Jubako inheritances.

#### app/views/top/index.slim

```slim
- extends 'layouts/base_template'

- block :body
  h1 Top#index
  p Find me in app/views/top/index.slim
```

#### app/views/layouts/base_template.slim

```slim
- block :title
  title Base template's title

= block :body
```

#### app/views/layouts/application.slim

```slim
doctype html
html
  head
    = block :title
  body
    = yield
```

#### Output

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Base template's title</title>
  </head>
  <body>
    <h1>
      Top#index
    </h1>
    <p>
      Find me in app/views/top/index.slim
    </p>
  </body>
</html>
```

## Contributing

Jubako is under developing by [Yuki Hattori](https://github.com/yhatt/).

Bug reports and pull requests are welcome on GitHub at [https://github.com/yhatt/jubako](https://github.com/yhatt/jubako).


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
