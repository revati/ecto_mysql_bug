# Ecto/MySQL/Binary id bug

as sugested by https://elixirforum.com/t/odd-binary-id-mismatch/14719/11 created this seperate project for this bug to be isolated and easier to replicate.

## Bug description

After inserting row in mysql table it seems to have different id in mysql table, but i can receive inserted row by both ids.

Problems:
- why id is changed while inserting in mysql table, and why it isnt changed for struct returned from `Repo.insert!`
- why i can retrieve the same row with 2 different ids?

## Beginings 

- https://elixirforum.com/t/odd-binary-id-mismatch/14719/11
- https://github.com/elixir-ecto/ecto/issues/2602

## Usage 

- clone
- update mysql connection params in `config/config.exs`
- `mix ecto.create`
- `mix ecto.migrate`
- `mix test`

## Actual Environment to replicate the problem

| elixir environment     | mysql environment      | can reproduce bug |
|------------------------|------------------------|-------------------|
| Mac OS 10.13.5 (17F77) | Mac OS 10.13.5 (17F77) | No                |
| Mac OS 10.13.5 (17F77) | Ubuntu 16.04.4 LTS     | Yes               |
| Ubuntu 16.04.4 LTS     | Ubuntu 16.04.4 LTS     | Yes               |

**Elixir version (elixir -v):**

Erlang/OTP 21 [erts-10.0] [source] [64-bit] [smp:2:2] [ds:2:2:10] [async-threads:1] [hipe]

Elixir 1.6.6 (compiled with OTP 20)

**Database and version (PostgreSQL 9.4, MongoDB 3.2, etc.):**

MySQL 5.7.22 and 8.0.11

**Ecto version (mix deps):**

ecto 2.2.10 (Hex package) (mix)
locked at 2.2.10 (ecto) e7366dc8

**Database adapter and version (mix deps):**

mariaex 0.8.4 (Hex package) (mix)
locked at 0.8.4 (mariaex) 5dd42a60

**Operating system:**

Ubuntu 16.04.4 LTS (GNU/Linux 4.4.0-101-generic x86_64)
Codename: xenial

## Error inconsistencies

Most of the time test fails with

```
  1) test With autogenerated id (Bug.BugTest)
     test/bug_test.exs:7
     Assertion with == failed
     code:  assert new.id() == entity.id()
     left:  "745f3f31-043f-433f-3f7e-3f4e3f293c3f"
     right: "745f8031-04c7-43b4-b67e-9d4ec1293ca9"
     stacktrace:
       test/bug_test.exs:14: (test)



  2) test With pregenerated id (Bug.BugTest)
     test/bug_test.exs:17
     Assertion with == failed
     code:  assert new.id() == entity.id()
     left:  "6f3f2c73-183f-4345-3f3f-3f353f3f3a3f"
     right: "6f9b2c73-18be-4345-90ad-993589ac3aa8"
     stacktrace:
       test/bug_test.exs:26: (test)
```

Sometimes it sortof works:

```
  1) test With autogenerated id (Bug.BugTest)
     test/bug_test.exs:7
     ** (Ecto.NoResultsError) expected at least one result but got none in query:

     from p in Bug.PrimaryModule,
       where: p.id == ^"063fdf04-d61d-4b14-a66e-0493d52cdbdd"

     code: new = Repo.get!(PrimaryModule, entity.id)
     stacktrace:
       (ecto) lib/ecto/repo/queryable.ex:80: Ecto.Repo.Queryable.one!/4
       test/bug_test.exs:10: (test)
```

At least row in db isnt found with wrong `id`.
