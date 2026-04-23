#include <algorithm>
#include <iostream>
#include <memory>
#include <string>
#include <vector>

// 全局命名空间污染示例
using namespace std;

/*
 * 一个简单的 Shape 抽象基类
 * 为了触发 clang-tidy 的抽象类检查与虚析构建议
 */
class Shape {
  public:
    virtual double Area() const = 0;
    virtual void PrintName() const = 0;
    // clang-tidy 可能建议加上虚析构函数
    // ~Shape() = default;
};

/*
 * Rectangle 派生类实现
 */
class Rectangle : public Shape {
  public:
    Rectangle(double width, double height) : width_(width), height_(height) {}

    double Area() const override { return width_ * height_; }
    void PrintName() const override { cout << "Rectangle" << endl; }

  private:
    double width_;
    double height_;
};

/*
 * Circle 派生类实现
 */
class Circle : public Shape {
  public:
    Circle(double radius) : radius_(radius) {}

    double Area() const override { return 3.14159 * radius_ * radius_; }
    void PrintName() const override { cout << "Circle" << endl; }

  private:
    double radius_;
};

/*
 * 计算所有图形面积总和
 * 使用现代 C++ 范围算法
 */
double TotalArea(const vector<unique_ptr<Shape>> &shapes) {
    double sum = 0.0;
    for (const auto &s : shapes) {
        if (s) {
            sum += s->Area();
        }
    }
    return sum;
}

int main() {
    // 未使用变量示例（clang-tidy 会提示）
    int unused_var = 42;

    vector<unique_ptr<Shape>> shapes;
    shapes.push_back(make_unique<Rectangle>(3.0, 4.0));
    shapes.push_back(make_unique<Circle>(2.0));

    // 可能的逻辑改进点：使用 auto &&
    for (auto &shape : shapes) {
        shape->PrintName();
    }

    cout << "Total area = " << TotalArea(shapes) << endl;

    // 手动排序面积（触发 clang-tidy 类型别名 / lambda 风格建议）
    sort(shapes.begin(), shapes.end(),
         [](auto const &a, auto const &b) { return a->Area() < b->Area(); });

    // 再次输出排序后面积
    cout << "Areas in ascending order:";
    for (auto const &s : shapes) {
        cout << " " << s->Area();
    }
    cout << endl;

    return 0;
}
