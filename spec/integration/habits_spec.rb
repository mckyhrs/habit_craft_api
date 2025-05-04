require "swagger_helper"

RSpec.describe "Habits API", type: :request do
  path "/api/v1/habits" do
    get "習慣の一覧を取得" do
      tags "Habits"
      produces "application/json"

      response "200", "success" do
        schema type: :array, items: {
          type: :object,
          properties: {
            id: { type: :integer },
            title: { type: :string },
            description: { type: :string },
            created_at: { type: :string },
            updated_at: { type: :string }
          },
          required: [ "id", "title", "description" ]
        }

        run_test!
      end
    end

    post "習慣を作成" do
      tags "Habits"
      consumes "application/json"
      parameter name: :habit, in: :body, schema: {
        type: :object,
        properties: {
          habit: {
            type: :object,
            properties: {
              title: { type: :string },
              description: { type: :string }
            },
            required: [ "title" ]
          }
        }
      }

      response "201", "created" do
        let(:habit) { { title: "New Habit", description: "Habit description" } }
        run_test!
      end

      response "422", "invalid request" do
        let(:habit) { { habit: { title: "" } } }
        run_test!
      end
    end

    post "習慣を更新" do
      tags "Habits"
      consumes "application/json"
      parameter name: :habit, in: :body, schema: {
        type: :object,
        properties: {
          habit: {
            type: :object,
            properties: {
              title: { type: :string },
              description: { type: :string }
            },
            required: [ "title" ]
          }
        }
      }

      response "201", "created" do
        let(:habit) { { title: "New Habit", description: "Habit description" } }
        run_test!
      end

      response "422", "invalid request" do
        let(:habit) { { habit: { title: "" } } }
        run_test!
      end
    end
  end
end
