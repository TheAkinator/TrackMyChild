//
//  UIView+Extension.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import UIKit

enum ConstraintRelation {
    case equalTo
    case lessThanOrEqual
    case greaterThanOrEqual
}

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    var parentViewController: UIViewController? {
        sequence(first: self) { $0.next }
            .first { $0 is UIViewController }
            .flatMap { $0 as? UIViewController }
    }
}

extension UIView {
    @discardableResult
    func leadingAnchor(
        equalTo anchor: NSLayoutXAxisAnchor,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        constraints.first { $0 == leadingAnchor }?.isActive = false

        var constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = leadingAnchor.constraint(equalTo: anchor, constant: constant)
        case .greaterThanOrEqual:
            constraint = leadingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        case .lessThanOrEqual:
            constraint = leadingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        @unknown default:
            return nil
        }
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func trailingAnchor(
        equalTo anchor: NSLayoutXAxisAnchor,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        constraints.first { $0 == trailingAnchor }?.isActive = false

        var constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = trailingAnchor.constraint(equalTo: anchor, constant: -constant)
        case .greaterThanOrEqual:
            constraint = trailingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: -constant)
        case .lessThanOrEqual:
            constraint = trailingAnchor.constraint(lessThanOrEqualTo: anchor, constant: -constant)
        @unknown default:
            return nil
        }
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func leftAnchor(
        equalTo anchor: NSLayoutXAxisAnchor,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        constraints.first { $0 == leftAnchor }?.isActive = false

        var constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = leftAnchor.constraint(equalTo: anchor, constant: constant)
        case .greaterThanOrEqual:
            constraint = leftAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        case .lessThanOrEqual:
            constraint = leftAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        @unknown default:
            return nil
        }
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func rightAnchor(
        equalTo anchor: NSLayoutXAxisAnchor,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        constraints.first { $0 == rightAnchor }?.isActive = false

        var constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = rightAnchor.constraint(equalTo: anchor, constant: -constant)
        case .greaterThanOrEqual:
            constraint = rightAnchor.constraint(greaterThanOrEqualTo: anchor, constant: -constant)
        case .lessThanOrEqual:
            constraint = rightAnchor.constraint(lessThanOrEqualTo: anchor, constant: -constant)
        @unknown default:
            return nil
        }
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func topAnchor(
        equalTo anchor: NSLayoutYAxisAnchor,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        constraints.first { $0 == topAnchor }?.isActive = false

        var constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = topAnchor.constraint(equalTo: anchor, constant: constant)
        case .greaterThanOrEqual:
            constraint = topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        case .lessThanOrEqual:
            constraint = topAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        @unknown default:
            return nil
        }
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func bottomAnchor(
        equalTo anchor: NSLayoutYAxisAnchor,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        constraints.first { $0 == bottomAnchor }?.isActive = false

        var constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = bottomAnchor.constraint(equalTo: anchor, constant: -constant)
        case .greaterThanOrEqual:
            constraint = bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: -constant)
        case .lessThanOrEqual:
            constraint = bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: -constant)
        @unknown default:
            return nil
        }
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func widthAnchor(
        relation: ConstraintRelation = .equalTo,
        equalTo constant: CGFloat = 0,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        constraints.first { $0 == widthAnchor }?.isActive = false
        var heightConstraint: NSLayoutConstraint
        switch relation {
        case .equalTo:
            heightConstraint = widthAnchor.constraint(equalToConstant: constant)
        case .lessThanOrEqual:
            heightConstraint = widthAnchor.constraint(lessThanOrEqualToConstant: constant)
        case .greaterThanOrEqual:
            heightConstraint = widthAnchor.constraint(greaterThanOrEqualToConstant: constant)
        }
        heightConstraint.priority = priority
        heightConstraint.isActive = true
        return heightConstraint
    }

    @discardableResult
    func heightAnchor(
        relation: ConstraintRelation = .equalTo,
        equalTo constant: CGFloat = 0,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        constraints.first { $0 == heightAnchor }?.isActive = false
        var heightConstraint: NSLayoutConstraint
        switch relation {
        case .equalTo:
            heightConstraint = heightAnchor.constraint(equalToConstant: constant)
        case .lessThanOrEqual:
            heightConstraint = heightAnchor.constraint(lessThanOrEqualToConstant: constant)
        case .greaterThanOrEqual:
            heightConstraint = heightAnchor.constraint(greaterThanOrEqualToConstant: constant)
        }
        heightConstraint.priority = priority
        heightConstraint.isActive = true
        return heightConstraint
    }

    @discardableResult
    func heightAnchor(
        equalTo anchor: NSLayoutDimension,
        multiplier: CGFloat = 1,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal
    ) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        constraints.first { $0 == heightAnchor }?.isActive = false

        var constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = heightAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constant)
        case .greaterThanOrEqual:
            constraint = heightAnchor.constraint(greaterThanOrEqualTo: anchor, multiplier: multiplier, constant: constant)
        case .lessThanOrEqual:
            constraint = heightAnchor.constraint(lessThanOrEqualTo: anchor, multiplier: multiplier, constant: constant)
        @unknown default:
            return nil
        }
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func widthAnchor(
        equalTo anchor: NSLayoutDimension,
        multiplier: CGFloat = 1,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal
    ) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        constraints.first { $0 == widthAnchor }?.isActive = false

        var constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = widthAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constant)
        case .greaterThanOrEqual:
            constraint = widthAnchor.constraint(greaterThanOrEqualTo: anchor, multiplier: multiplier, constant: constant)
        case .lessThanOrEqual:
            constraint = widthAnchor.constraint(lessThanOrEqualTo: anchor, multiplier: multiplier, constant: constant)
        @unknown default:
            return nil
        }
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func centerHorizontal(
        equalTo anchor: NSLayoutXAxisAnchor,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        constraints.first { $0 == centerXAnchor }?.isActive = false

        var constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = centerXAnchor.constraint(equalTo: anchor, constant: constant)
        case .greaterThanOrEqual:
            constraint = centerXAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        case .lessThanOrEqual:
            constraint = centerXAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        @unknown default:
            return nil
        }
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func centerVertical(
        equalTo anchor: NSLayoutYAxisAnchor,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        constraints.first { $0 == centerYAnchor }?.isActive = false

        var constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = centerYAnchor.constraint(equalTo: anchor, constant: constant)
        case .greaterThanOrEqual:
            constraint = centerYAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        case .lessThanOrEqual:
            constraint = centerYAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        @unknown default:
            return nil
        }
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    var safeTopAnchor: NSLayoutYAxisAnchor {
        safeAreaLayoutGuide.topAnchor
    }

    var safeLeftAnchor: NSLayoutXAxisAnchor {
        safeAreaLayoutGuide.leftAnchor
    }

    var safeLeadingAnchor: NSLayoutXAxisAnchor {
        safeAreaLayoutGuide.leadingAnchor
    }

    var safeRightAnchor: NSLayoutXAxisAnchor {
        safeAreaLayoutGuide.rightAnchor
    }

    var safeTrailingAnchor: NSLayoutXAxisAnchor {
        safeAreaLayoutGuide.trailingAnchor
    }

    var safeBottomAnchor: NSLayoutYAxisAnchor {
        safeAreaLayoutGuide.bottomAnchor
    }
}
