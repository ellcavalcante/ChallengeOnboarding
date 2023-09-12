//
//  ViewController.swift
//  ChallengeOnboarding
//
//  Created by Ellington Cavalcante on 04/09/23.
//

import UIKit

class ViewController: UIPageViewController {
    
    var pages = [UIViewController]()
    let pageControl = UIPageControl()
    let nextScreenButton = UIButton()
    let initialPage = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        style()
        layout()
        
        Utils.setFirstAccess(value: true)
        
    }
    
    private func goToNextPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        guard let currentPage = viewControllers?[0] else { return }
        guard let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentPage) else { return }

        setViewControllers([nextPage], direction: .forward, animated: animated, completion: completion)
    }
    
    private func gotToWelcomePage() {
        let welcome: LoginViewController = LoginViewController()
        navigationController?.pushViewController(welcome, animated: true)
    }
}

extension ViewController: Onboarding1ViewControllerProtocol {
    
    func actionOnBoarding1ArrowButton() {
        pageControl.currentPage += 1
        goToNextPage()
    }
    
    func actionOnBoarding1SkipButton() {
        gotToWelcomePage()
    }
}

extension ViewController: Onboarding2ViewControllerProtocol {
    func actionOnBoarding2ArrowButton() {
        pageControl.currentPage += 1
        goToNextPage()
    }
    
    func actionOnBoarding2SkipButton() {
        gotToWelcomePage()
    }
}

extension ViewController: Onboarding3ViewControllerProtocol {
    func actionBeginButton() {
        gotToWelcomePage()
    }
}

extension ViewController {
    func setup() {
        dataSource = self
        delegate = self
        
        pageControl.addTarget(self, action: #selector(pageControlTapped), for: .valueChanged)
        
        let page1 = Onboarding1ViewController()
        page1.delegate = self
        let page2 = Onboarding2ViewController()
        page2.delegate = self
        let page3 = Onboarding3ViewController()
        page3.delegate = self
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        setViewControllers([pages[initialPage]], direction: .forward, animated: true)
    }
    
    func style() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = UIColor(red: 93/255, green: 211/255, blue: 158/255, alpha: 1.0)
        pageControl.pageIndicatorTintColor = .systemGray2
        pageControl.isUserInteractionEnabled = false
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
    }
    
    func layout() {
        view.addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -62),
        ])
    }
}

extension ViewController {
    @objc func pageControlTapped(_ sender: UIPageControl) {
        setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true)
    }
}

extension ViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex > 0 else {
            return nil
        }
        return pages[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex < pages.count - 1 else {
            return nil
        }
        return pages[currentIndex + 1]
    }
}

extension ViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {

        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }

        pageControl.currentPage = currentIndex
    }
}
